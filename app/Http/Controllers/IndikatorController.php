<?php

namespace App\Http\Controllers;

use App\Models\Indikator;
use App\Http\Requests\StoreIndikatorRequest;
use App\Http\Requests\UpdateIndikatorRequest;
use App\Models\InstrumenAudit;
use App\Models\PernyataanStandar;
use App\Models\Unit;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $pernyataans = PernyataanStandar::where('status', 'aktif')->get();
        $units = Unit::all(); // Pastikan untuk mendapatkan semua unit
        return view('indikator.create', compact('pernyataans', 'units'));
    }
    public function getPernyataanByUnit($unitId)
    {
        $pernyataans = PernyataanStandar::where('id_unit', $unitId)
            ->where('status', 'aktif')
            ->get();
        return response()->json($pernyataans);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            // Validasi data yang diterima dari request
            $validatedData = $request->validate([
                'no' => 'required',
                'indikator' => 'required',
                'id_pernyataan' => 'required',
            ]);

            // Cek apakah indikator dengan no dan id_pernyataan yang sama sudah ada
            // $exists = Indikator::where('no', $validatedData['no'])
            //     ->where('id_pernyataan', $validatedData['id_pernyataan'])
            //     ->exists();

            // if ($exists) {
            //     // Jika sudah ada, kembalikan pesan kesalahan
            //     return redirect()->back()->with('failed', 'Indikator sudah ada');
            // }

            // Jika tidak ada, simpan data indikator baru
            Indikator::create($validatedData);

            // Kembalikan pesan sukses setelah menyimpan data
            return redirect()->back()->with('success', 'Indikator berhasil ditambahkan');
        } catch (\Exception $e) {
            // Tangani pengecualian dengan menampilkan pesan kesalahan
            return redirect()->back()->with('failed', 'Terjadi kesalahan: ' . $e->getMessage());
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
        DB::beginTransaction();

        try {
            $checkInstrument = InstrumenAudit::where('id_indikator', $indikator->id)->first();


            if ($checkInstrument) {
                DB::rollBack();
                return response()->json(['message' => 'Tidak dapat menghapus Indikator karena masih terkait dengan entitas lain.'], 400);
            }

            $indikator->delete();

            DB::commit();

            return response()->json(['message' => 'Indikator berhasil dihapus!'], 200);
        } catch (Exception $e) {
            DB::rollBack();

            return response()->json(['message' => 'Terjadi kesalahan!'], 500);
        }
    }
}
