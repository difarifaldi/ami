<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use App\Http\Requests\StoreUnitRequest;
use App\Http\Requests\UpdateUnitRequest;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UnitController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $units = Unit::all();
        return view('unit.index', compact('units'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('unit.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nama' => 'required',
            'gambar' => 'required|image|file|max:1024'
        ]);
        if ($request->file('gambar')) {
            $validatedData['gambar'] = $request->file('gambar')->store('unit-images', 'public');
        }

        Unit::create($validatedData);
        return redirect('/unit')->with('success', 'Unit baru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(Unit $unit)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Unit $unit)
    {
        return view('unit.edit', compact('unit'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Unit $unit)
    {

        $validatedData = $request->validate([
            'nama' => 'required',
            'gambar' => 'required|image|file|max:1024'
        ]);

        if ($request->file('gambar')) {
            if ($unit->gambar) {
                Storage::delete($unit->gambar);
            }
            $validatedData['gambar'] = $request->file('gambar')->store('unit-images', 'public');
        }
        Unit::where('id', $unit->id)->update($validatedData);
        return redirect('/unit')->with('success', 'Unit berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Unit $unit)
    {
        $unit->delete();
        return redirect('/unit')->with('success', 'Unit berhasil dihapus');
    }
}
