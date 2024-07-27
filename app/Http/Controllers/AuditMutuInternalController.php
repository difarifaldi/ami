<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Http\Requests\StoreAuditMutuInternalRequest;
use App\Http\Requests\UpdateAuditMutuInternalRequest;
use App\Models\TahunAkademik;
use App\Models\Unit;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuditMutuInternalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id();
        $audits = collect(); // Inisialisasi variabel audits sebagai koleksi kosong

        if (auth()->user()->hasRole('auditee')) {
            $audits = AuditMutuInternal::where('id_user_auditee', $userId)->get();
        } elseif (auth()->user()->hasRole('auditor')) {
            $audits = AuditMutuInternal::where(function ($query) use ($userId) {
                $query->where('id_user_auditor_ketua', $userId)
                    ->orWhere('id_user_auditor_anggota1', $userId)
                    ->orWhere('id_user_auditor_anggota2', $userId);
            })->get();
        } elseif (auth()->user()->hasRole('manajemen')) {
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
            'id_TA' => 'required',
            'tanggal' => 'required',
        ]);

        $existingAMI = AuditMutuInternal::where('id_unit', $validatedData['id_unit'])
            ->where('id_TA', $validatedData['id_TA'])
            ->get();

        $onGoingAMI = AuditMutuInternal::where('id_unit', $validatedData['id_unit'])
            ->where('status_audit', 'belum selesai')
            ->get();

        if ($existingAMI->count() > 0) {
            return redirect()->back()->withInput()->with('error', 'Sudah terdapat Audit Mutu Internal pada Tahun Akademik Ini.');
        }

        if ($onGoingAMI->count() > 0) {
            return redirect()->back()->withInput()->with('error', 'Audit Mutu Internal pada Unit ini sedang berjalan.');
        }


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
    public function edit(AuditMutuInternal $auditMutuInternal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAuditMutuInternalRequest $request, AuditMutuInternal $auditMutuInternal)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AuditMutuInternal $auditMutuInternal)
    {
        //
    }
}
