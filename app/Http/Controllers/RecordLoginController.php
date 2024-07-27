<?php

namespace App\Http\Controllers;

use App\Models\RecordLogin;
use App\Http\Requests\StoreRecordLoginRequest;
use App\Http\Requests\UpdateRecordLoginRequest;

class RecordLoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = RecordLogin::orderBy('waktu_login', 'DESC')->get();

        return view('record.index', compact('records'));
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
    public function store(StoreRecordLoginRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(RecordLogin $recordLogin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(RecordLogin $recordLogin)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRecordLoginRequest $request, RecordLogin $recordLogin)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(RecordLogin $recordLogin)
    {
        //
    }
}
