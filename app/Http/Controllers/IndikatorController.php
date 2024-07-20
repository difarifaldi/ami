<?php

namespace App\Http\Controllers;

use App\Models\Indikator;
use App\Http\Requests\StoreIndikatorRequest;
use App\Http\Requests\UpdateIndikatorRequest;
use App\Models\PernyataanStandar;
use App\Models\Unit;
use Exception;
use Illuminate\Http\Request;

class IndikatorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pernyataanID = PernyataanStandar::where('status', 'aktif')->pluck('id');
        $indikators = Indikator::whereIn('id_pernyataan', $pernyataanID)->get();

        return view('indikator.index', compact('indikators'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $pernyataans = PernyataanStandar::all();
        $units = Unit::all(); // Pastikan untuk mendapatkan semua unit
        return view('indikator.create', compact('pernyataans', 'units'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'no' => 'required',
            'indikator' => 'required',
            'id_pernyataan' => 'required',
        ]);

        Indikator::create($validatedData);
        return redirect('/indikator/create')->with('success', 'Indikator baru berhasil ditambahkan');
    }


    public function getPernyataanByUnit($unitId)
    {
        $pernyataans = PernyataanStandar::where('id_unit', $unitId)->get();
        return response()->json($pernyataans);
    }




    /**
     * Display the specified resource.
     */
    public function show(Indikator $indikator)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $indikator = Indikator::findOrFail($id);
        $units = Unit::all();
        $pernyataans = PernyataanStandar::where('id_unit', $indikator->pernyataan->id_unit)->get();
        return view('indikator.edit', compact('indikator', 'pernyataans', 'units'));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Indikator $indikator)
    {
        $validatedData = $request->validate([
            'no' => 'required',
            'indikator' => 'required',
            'id_pernyataan' => 'required',
        ]);
        $indikator->update($validatedData);
        return redirect('/indikator')->with('success', 'Indikator berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Indikator $indikator)
    {
        //
    }
}
