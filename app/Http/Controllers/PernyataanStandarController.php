<?php

namespace App\Http\Controllers;

use App\Models\PernyataanStandar;
use App\Http\Requests\StorePernyataanStandarRequest;
use App\Http\Requests\UpdatePernyataanStandarRequest;
use App\Models\Indikator;
use App\Models\Unit;
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
        $units = Unit::all();
        return view('pernyataan.create', compact('units'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'no_ps' => 'required|numeric',
            'pernyataan_standar' => 'required',
            'id_unit' => 'required',
        ]);
        $existPernyataan = PernyataanStandar::where('no_ps', $validatedData['no_ps'])->where('id_unit', $validatedData['id_unit'])->where('status', 'aktif')->exists();

        if ($existPernyataan) {
            return redirect()->back()->with('failed', 'Sudah terdapat pernyataan standar pada unit ini');
        }
        PernyataanStandar::create($validatedData);
        return redirect('/pernyataan/create')->with('success', 'Pernyataan standar baru berhasil ditambahkan');
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
        $units = Unit::all();
        return view('pernyataan.edit', compact('pernyataan', 'units'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PernyataanStandar $pernyataan)
    {

        $validatedData = $request->validate([
            'no_ps' => 'required',
            'pernyataan_standar' => 'required',
            'id_unit' => 'required',
        ]);
        $existPernyataan = PernyataanStandar::where('no_ps', $validatedData['no_ps'])
            ->where('id_unit', $validatedData['id_unit'])
            ->where('status', 'aktif')
            ->where('id', '!=', $pernyataan->id) // Pastikan tidak termasuk data yang sedang diupdate
            ->exists();

        if ($existPernyataan) {
            return redirect()->back()->with('failed', 'Sudah terdapat pernyataan standar pada unit ini');
        }
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

    public function togglePernyataanStatus(Request $request)
    {
        try {
            // Ambil ID pernyataan dari request
            $pernyataanId = $request->input('pernyataanId');
            $pernyataan = PernyataanStandar::findOrFail($pernyataanId);
    
            // Ambil nomor pernyataan dan ID unit dari pernyataan yang sedang diupdate
            $noPernyataan = $pernyataan->no_ps;
            $idUnit = $pernyataan->id_unit;
    
            // Cek jika ada pernyataan lain dengan nomor yang sama dan unit yang sama yang statusnya aktif
            $existingActive = PernyataanStandar::where('no_ps', $noPernyataan)
                ->where('id_unit', $idUnit)
                ->where('status', 'aktif')
                ->where('id', '!=', $pernyataanId)
                ->exists();
    
            // Jika pernyataan yang sama sudah aktif, dan status yang sedang diupdate ingin diubah menjadi aktif
            if ($existingActive && $pernyataan->status === 'tidak aktif') {
                return response()->json([
                    'error' => 'Tidak dapat mengubah status menjadi aktif. Pernyataan dengan nomor yang sama sudah ada dan aktif.'
                ], 400);
            }
    
            // Toggle status pernyataan
            $pernyataan->status = $pernyataan->status === 'aktif' ? 'tidak aktif' : 'aktif';
    
            // Simpan perubahan status ke dalam database
            $pernyataan->save();
    
            return response()->json(['message' => 'Status pernyataan berhasil diperbarui!'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    
}
