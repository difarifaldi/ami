<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\AuditMutuInternal;
use App\Models\Indikator;
use App\Models\StatusAkhir;
use App\Models\StatusTemuan;
use App\Models\StatusTercapai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class InstrumenAuditController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id();

        $userIsAuthorized = AuditMutuInternal::where('id_user_auditee', $userId)
            ->orWhere('id_user_auditor_ketua', $userId)
            ->orWhere('id_user_auditor_anggota1', $userId)
            ->orWhere('id_user_auditor_anggota2', $userId)
            ->orWhere('id_user_manajemen', $userId)
            ->orWhere('id_user_admin', $userId)
            ->exists();

        if (!$userIsAuthorized) {
            return redirect('/')->with('failed', 'Anda tidak memiliki akses ke halaman ini');
        }


        $instruments = InstrumenAudit::query();

        // Tentukan kondisi berdasarkan peran pengguna
        if (auth()->user()->hasRole('auditee')) {
            // Ambil semua audit mutu internal yang terkait dengan pengguna auditee
            $auditMutuIds = AuditMutuInternal::where('id_user_auditee', $userId)->pluck('id');

            // Filter ketercapaian instrument berdasarkan audit mutu internal yang terkait atau belum diisi oleh auditee
            $instruments->whereIn('id_AMI', $auditMutuIds)->orWhereNull('id_AMI');
        }
        if (auth()->user()->hasRole('auditor')) {
            // Ambil semua audit mutu internal yang terkait dengan pengguna auditor
            $auditMutuIds = AuditMutuInternal::where(function ($query) use ($userId) {
                $query->where('id_user_auditor_ketua', $userId)
                    ->orWhere('id_user_auditor_anggota1', $userId)
                    ->orWhere('id_user_auditor_anggota2', $userId);
            })->pluck('id');
            $instruments->whereIn('id_AMI', $auditMutuIds)->whereNotNull('id_status_tercapai');
        }
        if (auth()->user()->hasRole('manajemen')) {
            $auditMutuIds = AuditMutuInternal::where('id_user_manajemen', $userId)->pluck('id');
            $instruments->whereIn('id_AMI', $auditMutuIds)->whereNotNull('id_status_temuan');
        }



        return view('instrument.index', [
            'instruments' => $instruments->get(),
            'indikators' => Indikator::all(),

        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $userId = Auth::id();
        $auditMutuIds = AuditMutuInternal::where('id_user_auditee', $userId)->pluck('id');
        $instrumentIds = InstrumenAudit::whereIn('id_AMI', $auditMutuIds)->pluck('id_indikator')->toArray();
        $indikators = Indikator::whereNotIn('id', $instrumentIds)->get();
        $status_tercapai = StatusTercapai::all();
        $indikator_lists = Indikator::all();
        return view('instrument.create', compact('indikators', 'status_tercapai', 'indikator_lists', 'instrumentIds'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validateData = $request->validate([
                'deskripsi_temuan' => 'required',
                'bukti' => 'required|url',
                'id_status_tercapai' => 'required',
                'akar_penyebab' => 'required',
                'akibat' => 'required',
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

            return redirect('/instrument')->with('success', 'Instrumen baru berhasil ditambahkan');
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
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

        return view('instrument.edit', compact('instrument', 'status_tercapai', 'status_akhir', 'status_temuan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, InstrumenAudit $instrument)
    {
        $validatedData = [];

        if ($request->user()->hasRole('superadmin')) {
            $validatedData = $request->validate([
                'no_ps' => 'required',
                'pernyataan_standar' => 'required',
                'no' => 'required',
                'indikator' => 'required',
            ]);
        }

        if ($request->user()->hasRole('auditee')) {
            $validatedData = $request->validate([
                'deskripsi_temuan' => 'required',
                'bukti' => 'required|url',
                'id_status_tercapai' => 'required',
                'akar_penyebab' => 'required',
                'akibat' => 'required',
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
                'penanggung_jawab' => 'required',
                'link' => 'required|url',
                'tanggapan_auditee' => 'required',
                'id_status_temuan' => 'required',
            ]);
        }

        if ($request->user()->hasRole('manajemen')) {
            $validatedData = $request->validate([
                'jadwal_penyelesaian' => 'required',
                'rencana_perbaikan' => 'required',
                'id_status_akhir' => 'required',
            ]);
        }

        $instrument->update($validatedData);

        return redirect('/instrument')->with('success', 'Instrumen berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(InstrumenAudit $instrumenAudit)
    {
        //
    }
}
