<?php

namespace App\Http\Controllers;

use App\Models\PernyataanStandar;
use App\Http\Requests\StorePernyataanStandarRequest;
use App\Http\Requests\UpdatePernyataanStandarRequest;
use App\Imports\PernyataanIndikatorImport;
use App\Models\Indikator;
use App\Models\InstrumenAudit;
use App\Models\TahunAkademik;
use App\Models\Unit;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class PernyataanStandarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
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
            // Cek apakah ada indikator yang terkait dengan instrumen
            $indikators = Indikator::where('id_pernyataan', $pernyataan->id)->get();

            foreach ($indikators as $indikator) {
                $check = InstrumenAudit::where('id_indikator', $indikator->id)->exists();

                // Jika ada indikator yang sudah terkait dengan instrumen audit
                if ($check) {
                    DB::rollBack();
                    return response()->json(['message' => 'Tidak dapat menghapus Pernyataan karena masih terkait dengan entitas lain.'], 400);
                }
            }

            // Jika tidak ada indikator terkait dengan instrumen, hapus pernyataan
            $pernyataan->delete();

            DB::commit();

            return response()->json(['message' => 'Pernyataan berhasil dihapus!'], 200);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }




    public function formImportData()
    {
        $units = Unit::all();
        $tahunAkademiks = TahunAkademik::all();
        return view('import.create', compact('units', 'tahunAkademiks'));
    }


    public function importData(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xls,xlsx',
            'id_unit' => 'required',
            'id_TA' => 'required',
        ]);

        try {
            // Kirim id_unit dan id_TA ke dalam class import
            Excel::import(new PernyataanIndikatorImport($request->id_unit, $request->id_TA), $request->file('file'));

            return back()->with('success', 'Data berhasil diimpor!');
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
    }
}
