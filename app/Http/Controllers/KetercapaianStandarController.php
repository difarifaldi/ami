<?php

namespace App\Http\Controllers;

use App\Models\KetercapaianStandar;
use App\Http\Requests\StoreKetercapaianStandarRequest;
use App\Http\Requests\UpdateKetercapaianStandarRequest;
use App\Models\StatusAkhir;
use App\Models\StatusTemuan;
use App\Models\StatusTercapai;
use Illuminate\Http\Request;

class KetercapaianStandarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $standars = KetercapaianStandar::query();

        if (auth()->user()->hasRole('auditor')) {
            $standars->whereNotNull('id_status_tercapai');
        }
        if (auth()->user()->hasRole('manajemen')) {
            $standars->whereNotNull('id_status_temuan');
        }

        return view('standar.index', [
            'standars' => $standars->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('standar.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validateData = $request->validate([
            'no_ps' => 'required',
            'pernyataan_standar' => 'required',
            'no' => 'required',
            'indikator' => 'required',
        ]);
        KetercapaianStandar::create($validateData);

        return redirect('/standar')->with('success', 'Instrument baru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(KetercapaianStandar $standar)
    {
        return view('standar.show', compact('standar'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(KetercapaianStandar $standar)
    {
        $status_tercapai = StatusTercapai::all();
        $status_temuan = StatusTemuan::all();
        $status_akhir = StatusAkhir::all();
        return view('standar.edit', compact('standar', 'status_tercapai', 'status_akhir', 'status_temuan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, KetercapaianStandar $standar)
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
        KetercapaianStandar::where('id', $standar->id)
            ->update($validatedData);
        return redirect('/standar')->with('success', 'Instrument baru berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(KetercapaianStandar $ketercapaianStandar)
    {
        //
    }
}
