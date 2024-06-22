<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Models\InstrumenAudit;
use App\Models\tahunAkademik;
use App\Models\Unit;
use PDF;
use Illuminate\Http\Request;


class LhaController extends Controller
{
    public function exportPDF(Request $request)
    {
        $selectedUnit = $request->input('select_unit');
        $selectedTA = $request->input('select_TA');

        $query = AuditMutuInternal::where('status_audit', 'selesai');

        if ($selectedUnit) {
            $query->where('id_unit', $selectedUnit);
        }

        if ($selectedTA) {
            $query->where('id_TA', $selectedTA);
        }

        $AuditID = $query->pluck('id');
        $instruments = InstrumenAudit::whereIn('id_AMI', $AuditID)->get();

        $pdf = PDF::loadView('lha.pdf', compact('instruments'))->setPaper('a4', 'portrait');

        return $pdf->download('Form LHA AMI Manajemen ' . $selectedUnit . '.pdf');
    }

    public function index(Request $request)
    {
        $selectedUnit = $request->input('select_unit');
        $selectedTA = $request->input('select_TA');
        $units = Unit::all();
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
