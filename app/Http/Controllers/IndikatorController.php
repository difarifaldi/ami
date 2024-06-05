<?php

namespace App\Http\Controllers;

use App\Models\Indikator;
use App\Http\Requests\StoreIndikatorRequest;
use App\Http\Requests\UpdateIndikatorRequest;
use App\Models\PernyataanStandar;
use Exception;
use Illuminate\Http\Request;

class IndikatorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $indikators = Indikator::all();
        return view('indikator.index', compact('indikators'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $pernyataans = PernyataanStandar::all();
        return view('indikator.create', compact('pernyataans'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'no' => 'required',
                'indikator' => 'required',
                'id_pernyataan' => 'required',
            ]);

            Indikator::create($validatedData);
            return redirect('/indikator')->with('success', 'Indikator baru berhasil ditambahkan');
        } catch (Exception $e) {
            dd($e->getMessage());
        }
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
    public function edit(Indikator $indikator)
    {
        $pernyataans = PernyataanStandar::all();
        return view('indikator.edit', compact('indikator', 'pernyataans'));
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
