<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\AuditMutuInternal;
use App\Models\Indikator;
use App\Models\PernyataanStandar;
use App\Models\StatusAkhir;
use App\Models\StatusTemuan;
use App\Models\StatusTercapai;
use App\Models\Unit;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class InstrumenAuditController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $userId = Auth::id();

        $data = AuditMutuInternal::where(function ($query) use ($userId) {
            $query->where('id_user_auditor_ketua', $userId)
                ->orWhere('id_user_auditor_anggota1', $userId)
                ->orWhere('id_user_auditor_anggota2', $userId)
                ->orWhere('id_user_manajemen', $userId)
                ->orWhere('id_user_auditee', $userId);
        })->where('status_audit', 'belum selesai');

        $userIsAuthorized = $data->exists();

        if (!$userIsAuthorized) {
            return redirect('/')->with('failed', 'Anda tidak memiliki akses ke halaman ini');
        }

        $unitId = $request->input('unit_id');
        $instrumentsQuery = InstrumenAudit::query();

        // Ambil semua unit yang terlibat dalam AMI dan terkait dengan pengguna yang login
        $unitIds = $data->pluck('id_unit')->unique();

        // Tentukan unit yang dipilih atau unit pertama sebagai default
        if (!$unitId && $unitIds->isNotEmpty()) {
            $unitId = $unitIds->first();
        }

        // Ambil semua instrumen yang terkait dengan unit-unit tersebut
        $allInstruments = InstrumenAudit::whereIn('id_AMI', $data->pluck('id'))->get();

        // Filter instrumen berdasarkan unit yang dipilih
        if ($unitId) {
            $auditMutuIds = AuditMutuInternal::where('status_audit', 'belum selesai')->where('id_unit', $unitId)->pluck('id');
            $instrumentsQuery->whereIn('id_AMI', $auditMutuIds);
        }

        // Tentukan kondisi berdasarkan peran pengguna
        if (auth()->user()->hasRole('auditee')) {
            $auditMutuIds = AuditMutuInternal::where('status_audit', 'belum selesai')->where('id_user_auditee', $userId)->pluck('id');
            $instrumentsQuery->whereIn('id_AMI', $auditMutuIds);
        }
        if (auth()->user()->hasRole('auditor')) {
            $auditMutuIds = AuditMutuInternal::where('status_audit', 'belum selesai')->where(function ($query) use ($userId) {
                $query->where('id_user_auditor_ketua', $userId)
                    ->orWhere('id_user_auditor_anggota1', $userId)
                    ->orWhere('id_user_auditor_anggota2', $userId);
            })->pluck('id');
            $instrumentsQuery->whereIn('id_AMI', $auditMutuIds)->whereNotNull('id_status_tercapai');
        }
        if (auth()->user()->hasRole('manajemen')) {
            $auditMutuIds = AuditMutuInternal::where('status_audit', 'belum selesai')->where('id_user_manajemen', $userId)->pluck('id');
            $instrumentsQuery->whereIn('id_AMI', $auditMutuIds)->whereNotNull('id_status_temuan');
        }

        // Ambil unit yang terkait dengan user
        $uniqueUnits = Unit::whereIn('id', $unitIds)->get();

        return view('instrument.index', [
            'instruments' => $instrumentsQuery->get(),
            'allInstruments' => $allInstruments,
            'uniqueUnits' => $uniqueUnits,
            'selectedUnitId' => $unitId,
        ]);
    }





    public function selesaikanAudit(Request $request)
    {
        try {
            $userId = Auth::id();
            $data = AuditMutuInternal::where('id_user_manajemen', $userId);

            // Validasi unitId untuk menghindari akses yang tidak sah
            $unitIds = $data->pluck('id_unit')->unique();
            $unitId = $request->input('unit_id');
            // Tentukan unit yang dipilih atau unit pertama sebagai default
            if (!$unitId && $unitIds->isNotEmpty()) {
                $unitId = $unitIds->first();
            }

            $auditMutuIds = $data->where('id_unit', $unitId)->where('status_audit', 'belum selesai')->pluck('id');

            // Ambil instrumen yang terkait dengan audit mutu internal yang sedang berlangsung
            $instruments = InstrumenAudit::whereIn('id_AMI', $auditMutuIds)
                ->get();

            // Hitung jumlah instrumen dan indikator
            $sumInstruments = $instruments->count();
            $sumIndikator = Indikator::whereIn('id_pernyataan', function ($query) use ($unitId) {
                $query->select('id')
                    ->from('pernyataan_standars')
                    ->where('id_unit', $unitId);
            })->count();

            if ($sumInstruments != $sumIndikator) {
                return redirect()->back()->with('failed', 'Auditee belum mengisi semua indikator');
            }

            // Cek instrumen yang belum lengkap
            $incompleteInstruments = $instruments->filter(function ($instrument) {
                return is_null($instrument->id_status_akhir) || is_null($instrument->id_status_temuan);
            });

            if ($incompleteInstruments->isNotEmpty()) {
                return redirect()->back()->with('failed', 'Terdapat Indikator yang belum diaudit.');
            }

            AuditMutuInternal::whereIn('id', $auditMutuIds)->update(['status_audit' => 'selesai']);

            // Berikan pesan sukses jika diperlukan
            return redirect()->back()->with('success', 'Audit berhasil diselesaikan.');
        } catch (\Exception $e) {
            // Tangani jika ada kesalahan
            Log::error('Error completing audit: ' . $e->getMessage());
            return redirect()->back()->with('failed', 'Terjadi kesalahan saat menyelesaikan audit.');
        }
    }




    public function create()
    {
        $userId = Auth::id();
        $userUnitId = Auth::user()->id_unit; // Ambil unit dari pengguna yang sedang login

        // Ambil id Audit Mutu Internal yang terkait dengan user auditee
        $auditMutuIds = AuditMutuInternal::where('id_user_auditee', $userId)->where('status_audit', 'belum selesai')->pluck('id');

        // Ambil id indikator dari Instrumen Audit yang terkait dengan id Audit Mutu Internal di atas
        $instrumentIds = InstrumenAudit::whereIn('id_AMI', $auditMutuIds)->pluck('id_indikator')->toArray();

        // Ambil pernyataan standar yang unitnya sama dengan unit pengguna yang sedang login
        $pernyataanIds = PernyataanStandar::where('id_unit', $userUnitId)->where('status', 'aktif')->pluck('id');

        // Filter indikator berdasarkan pernyataan yang ditemukan dan yang belum ada di Instrumen Audit
        $indikators = Indikator::whereIn('id_pernyataan', $pernyataanIds)
            ->whereNotIn('id', $instrumentIds)->orderBy('no', 'ASC')
            ->get();

        // Ambil semua status tercapai
        $status_tercapai = StatusTercapai::all();

        // Ambil semua indikator (opsional, tergantung kebutuhan view)
        $indikator_lists = Indikator::whereIn('id_pernyataan', $pernyataanIds)->orderBy('no', 'ASC')->get();

        return view('instrument.create', compact('indikators', 'status_tercapai', 'indikator_lists', 'instrumentIds'));
    }

    public function store(Request $request)
    {

        $validateData = $request->validate([
            'deskripsi_temuan' => 'required',
            'bukti' => 'nullable|url',
            'id_status_tercapai' => 'required',
            'akar_penyebab' => 'required',
            'akibat' => 'nullable',
            'id_indikator' => 'required',
        ]);
        $user = Auth::user();
        $auditMutuInternal = $user->auditAsAuditee()->latest()->first();

        if (!$auditMutuInternal) {
            return redirect()->back()->with('failed', 'Anda tidak memiliki Audit Mutu Internal yang terkait');
        }

        // Menyimpan ID audit mutu internal ke dalam data yang akan disimpan
        $validateData['id_AMI'] = $auditMutuInternal->id;


        InstrumenAudit::create($validateData);

        return redirect('/instrument/create')->with('success', 'Instrumen baru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(InstrumenAudit $instrument)
    {
        return view('instrument.show', compact('instrument'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(InstrumenAudit $instrument)
    {
        $status_tercapai = StatusTercapai::all();
        $status_temuan = StatusTemuan::all();
        $status_akhir = StatusAkhir::all();
        $user = User::all();


        return view('instrument.edit', compact('instrument', 'status_tercapai', 'status_akhir', 'status_temuan', 'user'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, InstrumenAudit $instrument)
    {

        $validatedData = [];

        if ($request->user()->hasRole('auditee')) {
            $validatedData = $request->validate([
                'deskripsi_temuan' => 'required',
                'bukti' => 'nullable|url',
                'id_status_tercapai' => 'nullable',
                'akar_penyebab' => 'required',
                'akibat' => 'nullable',
                'tanggapan_auditee' => 'nullable',
            ]);
            $user = Auth::user();

            // Mengambil ID audit mutu internal dari user auditee yang sedang login
            $auditMutuInternal = $user->auditAsAuditee()->latest()->first();

            if (!$auditMutuInternal) {
                return redirect()->back()->with('failed', 'Anda tidak memiliki Audit Mutu Internal yang terkait');
            }

            // Menyimpan ID audit mutu internal ke dalam data yang akan disimpan
            $validatedData['id_AMI'] = $auditMutuInternal->id;
        }

        if ($request->user()->hasRole('auditor')) {
            $validatedData = $request->validate([
                'temuan_audit' => 'required',
                'rekomendasi_auditor' => 'required',
                'penanggung_jawab' => 'nullable',
                'link' => 'nullable|url',
                'id_status_temuan' => 'required',
            ]);
        }

        if ($request->user()->hasRole('manajemen')) {
            $validatedData = $request->validate([
                'jadwal_penyelesaian' => 'nullable',
                'rencana_perbaikan' => 'nullable',
                'id_status_akhir' => 'required',
            ]);
        }

        $instrument->update($validatedData);


        return redirect()->route('instrument.index', ['unit_id' => $instrument->ami->id_unit])->with('success', 'Instrumen berhasil diperbaharui');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(InstrumenAudit $instrumenAudit)
    {
        //
    }
}
