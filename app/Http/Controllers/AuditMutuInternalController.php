<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Http\Requests\StoreAuditMutuInternalRequest;
use App\Http\Requests\UpdateAuditMutuInternalRequest;
use App\Models\Unit;
use App\Models\User;
use Illuminate\Http\Request;

class AuditMutuInternalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $audits = AuditMutuInternal::all();
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
        return view('ami.create', compact('units', 'auditees', 'auditors', 'admins', 'manajemens'));
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
            'id_user_auditor_anggota2' => 'required',
            'id_user_manajemen' => 'required',
            'id_user_admin' => 'required',
            'tanggal' => 'required',
        ]);

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
