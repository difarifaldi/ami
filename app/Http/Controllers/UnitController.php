<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use App\Http\Requests\StoreUnitRequest;
use App\Http\Requests\UpdateUnitRequest;
use App\Models\AuditMutuInternal;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
            'gambar' => 'nullable|image|file|max:1024'
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
            'gambar' => 'nullable|image|file|max:1024'
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
        DB::beginTransaction();

        try {
            $checkUnitUser = User::where('id_unit', $unit->id)->first();
            $checkUnitAMI = AuditMutuInternal::where('id_unit', $unit->id)->first();

            if ($checkUnitUser || $checkUnitAMI) {
                DB::rollBack();
                return response()->json(['message' => 'Tidak dapat menghapus Unit karena masih terkait dengan entitas lain.'], 400);
            }

            $unit->delete();

            DB::commit();

            return response()->json(['message' => 'Unit berhasil dihapus!'], 200);
        } catch (Exception $e) {
            DB::rollBack();

            return response()->json(['message' => 'Terjadi kesalahan!'], 500);
        }
    }
}
