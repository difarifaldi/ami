<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Models\InstrumenAudit;
use App\Models\tahunAkademik;
use App\Models\Unit;
use Illuminate\Http\Request;

class LhaController extends Controller
{

    public function index(Request $request)
    {
        $selectedUnit = $request->input('select_unit');
        $selectedTA = $request->input('select_TA');
        $units = Unit::orderBy('id', 'DESC')->get();
        $tahuns = tahunAkademik::all();

        // Mulai query dasar dengan status 'selesai'
        $query = AuditMutuInternal::where('status_audit', 'selesai');

        // Tambahkan kondisi filter berdasarkan unit yang dipilih
        if ($selectedUnit) {
            $query->where('id_unit', $selectedUnit);
        }

        // Tambahkan kondisi filter berdasarkan tahun akademik yang dipilih
        if ($selectedTA) {
            $query->where('id_TA', $selectedTA);
        }

        // Ambil ID dari query hasil filter
        $AuditID = $query->pluck('id');

        // Ambil instrumen terkait berdasarkan ID dari AMI
        $instruments = InstrumenAudit::whereIn('id_AMI', $AuditID)->get();

        return view('lha.index', compact('instruments', 'units', 'tahuns', 'selectedUnit', 'selectedTA'));
    }
}
