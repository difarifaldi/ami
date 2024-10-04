<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Http\Requests\StoreAuditMutuInternalRequest;
use App\Http\Requests\UpdateAuditMutuInternalRequest;
use App\Models\TahunAkademik;
use App\Models\Unit;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class AuditMutuInternalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id();
        $audits = collect(); // Inisialisasi variabel audits sebagai koleksi kosong

        if (User::find(auth()->user()->id)->hasRole('auditee')) {
            $audits = AuditMutuInternal::where('id_user_auditee', $userId)->get();
        } elseif (User::find(auth()->user()->id)->hasRole('auditor')) {
            $audits = AuditMutuInternal::where(function ($query) use ($userId) {
                $query->where('id_user_auditor_ketua', $userId)
                    ->orWhere('id_user_auditor_anggota1', $userId)
                    ->orWhere('id_user_auditor_anggota2', $userId);
            })->get();
        } elseif (User::find(auth()->user()->id)->hasRole('manajemen')) {
            $audits = AuditMutuInternal::where('id_user_manajemen', $userId)->get();
        } else {
            $audits = AuditMutuInternal::all(); // Jika pengguna tidak memiliki salah satu peran di atas, ambil semua audit
        }

        return view('ami.index', compact('audits'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $units = Unit::all();
        $auditees = User::role('auditee')->get();
        $auditors = User::role('auditor')->get();
        $manajemens = User::role('manajemen')->get();
        $admins = User::role('admin')->get();
        $tahuns = TahunAkademik::all();
        return view('ami.create', compact('units', 'auditees', 'auditors', 'admins', 'manajemens', 'tahuns'));
    }

    public function getAuditeeByUnit($unitId)
    {
        $auditees = User::role('auditee')->where('id_unit', $unitId)->get();

        return response()->json($auditees);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'id_unit' => 'required',
            'id_user_auditee' => 'required',
            'id_user_auditor_ketua' => 'required',
            'id_user_auditor_anggota1' => 'required',
            'id_user_auditor_anggota2' => 'nullable',
            'id_user_manajemen' => 'required',
            'tanggal' => 'required|date',
        ]);

        // Ambil tahun dari tanggal audit yang dikirim dari form
        $yearFromTanggal = date('Y', strtotime($validatedData['tanggal']));

        // Cari id_TA dari model TahunAkademik berdasarkan tahun
        $idTA = TahunAkademik::where('nama', $yearFromTanggal)->value('id');

        // Jika tidak ditemukan, berikan pesan error
        if (!$idTA) {
            return redirect()->back()->withInput()->with('error', 'Tahun Akademik tidak ditemukan.');
        }

        // Cek apakah Audit Mutu Internal sudah ada untuk tahun akademik ini dan unit yang sama
        $existingAMI = AuditMutuInternal::where('id_unit', $validatedData['id_unit'])
            ->where('id_TA', $idTA)
            ->exists();

        $onGoingAMI = AuditMutuInternal::where('id_unit', $validatedData['id_unit'])
            ->where('status_audit', 'belum selesai')
            ->exists();

        if ($existingAMI) {
            return redirect()->back()->withInput()->with('error', 'Sudah terdapat Audit Mutu Internal pada Tahun Akademik Ini.');
        }

        if ($onGoingAMI) {
            return redirect()->back()->withInput()->with('error', 'Audit Mutu Internal pada Unit ini sedang berjalan.');
        }

        // Tambahkan id_TA ke data yang divalidasi sebelum menyimpannya ke database
        $validatedData['id_TA'] = $idTA;

        // Simpan Audit Mutu Internal
        AuditMutuInternal::create($validatedData);

        return redirect('/audit')->with('success', 'Data Audit Berhasil Ditambahkan');
    }



    /**
     * Display the specified resource.
     */
    public function show(AuditMutuInternal $auditMutuInternal)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(AuditMutuInternal $audit)
    {

        $auditors = User::role('auditor')->get();

        return view('ami.edit', compact('auditors', 'audit'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AuditMutuInternal $audit)
    {
        try {
            // Cek nilai audit yang akan diupdate

            $validatedData = $request->validate([
                'id_user_auditor_ketua' => 'required',
                'id_user_auditor_anggota1' => 'required',
                'id_user_auditor_anggota2' => 'nullable',
                'tanggal' => 'required|date',
            ]);

            // Update data audit
            $audit->update($validatedData);

            return redirect('/audit')->with('success', 'Data penugasan audit berhasil diubah');
        } catch (\Exception $e) {
            Log::error('Update error: ' . $e->getMessage());
            return back()->with('error', 'Terjadi kesalahan saat mengubah data.');
        }
    }





    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AuditMutuInternal $audit)
    {
        //
    }
}
