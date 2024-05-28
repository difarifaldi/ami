<?php

namespace App\Http\Controllers;

use App\Models\Kui;
use App\Models\StatusAkhir;
use App\Models\StatusTemuan;
use App\Models\StatusTercapai;
use Illuminate\Http\Request;

class KuiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $kuis = Kui::query();

        if (auth()->user()->hasRole('auditor')) {
            $kuis->whereNotNull('id_status_tercapai');
        }
        if (auth()->user()->hasRole('manajemen')) {
            $kuis->whereNotNull('id_status_temuan');
        }

        return view('kui.index', [
            'kuis' => $kuis->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('kui.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validateData = $request->validate([
            'no_ps' => 'required',
            'pernyataan_standar' => 'required',
            'no' => 'required|unique:kui_instruments',
            'indikator' => 'required',
        ]);
        Kui::create($validateData);

        return redirect('/kui')->with('success', 'Instrument baru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(Kui $kui)
    {
        return view('kui.show', compact('kui'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Kui $kui)
    {
        $status_tercapai = StatusTercapai::all();
        $status_temuan = StatusTemuan::all();
        $status_akhir = StatusAkhir::all();
        return view('kui.edit', compact('kui', 'status_tercapai', 'status_akhir', 'status_temuan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Kui $kui)
    {
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
                'keadaan' => 'required',
                'bukti' => 'required|url',
                'id_status_tercapai' => 'required',
            ]);
        }
        if ($request->user()->hasRole('auditor')) {
            $validatedData = $request->validate([
                'temuan' => 'required',
                'rekomendasi' => 'required',
                'penanggung_jawab' => 'required',
                'link' => 'required|url',
                'id_status_temuan' => 'required',
            ]);
        }
        if ($request->user()->hasRole('manajemen')) {
            $validatedData = $request->validate([
                'important' => 'required',
                'urgen' => 'required',
                'rencana' => 'required',
                'id_status_akhir' => 'required',
            ]);
        }

        // $kui = kui::findOrFail($kui->id);
        // $kui->update($validatedData);
        kui::where('id', $kui->id)
            ->update($validatedData);
        return redirect('/kui')->with('success', 'Instrument baru berhasil diubah');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kui $kui)
    {
        //
    }
}
