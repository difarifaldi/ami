<?php

namespace App\Http\Controllers;

use App\Models\StatusTemuan;
use App\Http\Requests\StoreStatusTemuanRequest;
use App\Http\Requests\UpdateStatusTemuanRequest;
use App\Models\tahunAkademik;
use App\Models\Unit;
use Illuminate\Http\Request;

class StatusTemuanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // Ambil filter unit dan tahun akademik dari request
        $selectedUnit = $request->input('select_unit');
        $selectedTA = $request->input('select_TA');

        // Ambil data unit dan tahun akademik
        $units = Unit::all();
        $tahuns = tahunAkademik::all();

        // Query status temuan dengan relasi instrument
        $query = StatusTemuan::with(['instrument' => function ($query) use ($selectedUnit, $selectedTA) {
            if ($selectedUnit) {
                $query->whereHas('ami.unit', function ($query) use ($selectedUnit) {
                    $query->where('nama', $selectedUnit);
                });
            }
            if ($selectedTA) {
                $query->whereHas('ami.tahunAkademik', function ($query) use ($selectedTA) {
                    $query->where('nama', $selectedTA);
                });
            }
        }]);

        // Ambil data status temuan berdasarkan filter
        $status = $query->get();

        // Hitung total jumlah instrumen untuk semua status
        $totalInstruments = $status->sum(function ($status) {
            return $status->instrument->count();
        });

        return view('status.index', compact('status', 'totalInstruments', 'units', 'tahuns', 'selectedUnit', 'selectedTA'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreStatusTemuanRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(StatusTemuan $statusTemuan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(StatusTemuan $statusTemuan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateStatusTemuanRequest $request, StatusTemuan $statusTemuan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(StatusTemuan $statusTemuan)
    {
        //
    }
}
