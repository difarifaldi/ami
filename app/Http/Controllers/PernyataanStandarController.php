<?php

namespace App\Http\Controllers;

use App\Models\PernyataanStandar;
use App\Http\Requests\StorePernyataanStandarRequest;
use App\Http\Requests\UpdatePernyataanStandarRequest;
use App\Models\Indikator;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PernyataanStandarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pernyataans = PernyataanStandar::all();
        return view('pernyataan.index', compact('pernyataans'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('pernyataan.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'no_ps' => 'required',
            'pernyataan_standar' => 'required',
        ]);

        PernyataanStandar::create($validatedData);
        return redirect('/pernyataan')->with('success', 'Pernyataan baru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(PernyataanStandar $pernyataanStandar)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PernyataanStandar $pernyataan)
    {
        return view('pernyataan.edit', compact('pernyataan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PernyataanStandar $pernyataan)
    {

        $validatedData = $request->validate([
            'no_ps' => 'required',
            'pernyataan_standar' => 'required',
        ]);

        $pernyataan->update($validatedData);
        return redirect('/pernyataan')->with('success', 'Pernyataan berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PernyataanStandar $pernyataan)
    {
        DB::beginTransaction();

        try {
            $checkIndikator = Indikator::where('id_pernyataan', $pernyataan->id)->first();


            if ($checkIndikator) {
                DB::rollBack();
                return response()->json(['message' => 'Tidak dapat menghapus Pernyataan karena masih terkait dengan entitas lain.'], 400);
            }

            $pernyataan->delete();

            DB::commit();

            return response()->json(['message' => 'Pernyataan berhasil dihapus!'], 200);
        } catch (Exception $e) {
            DB::rollBack();

            return response()->json(['message' => 'Terjadi kesalahan!'], 500);
        }
    }
}
