<?php

namespace App\Http\Controllers;

use App\Models\StatusTemuan;
use App\Http\Requests\StoreStatusTemuanRequest;
use App\Http\Requests\UpdateStatusTemuanRequest;

class StatusTemuanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $status = StatusTemuan::with('instrument')->get();

        // Hitung total jumlah instrumen untuk semua status
        $totalInstruments = $status->sum(function ($status) {
            return $status->instrument->count();
        });

        return view('status.index', compact('status', 'totalInstruments'));
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
