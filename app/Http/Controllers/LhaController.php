<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Models\InstrumenAudit;
use App\Models\tahunAkademik;
use App\Models\Unit;
use PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LhaController extends Controller
{
    public function index()
    {
        $userID = Auth::id();
        if (auth()->user()->hasRole('manajemen')) {
            $audits = AuditMutuInternal::with(['instrument'])
                ->where('id_user_manajemen', $userID)
                ->get();
        } else {
            $audits = AuditMutuInternal::with(['instrument'])->get();
        }
        return view('lha.index', compact('audits'));
    }
    public function exportPDF(Request $request)
    {
        $ami = $request->input('id_ami');

        if (!is_array($ami)) {
            $ami = [$ami];
        }

        $auditMutuInternals = AuditMutuInternal::whereIn('id', $ami)->get();


        // Periksa apakah ada AuditMutuInternal yang status_audit-nya "belum selesai"
        $hasUnfinishedAudit = $auditMutuInternals->where('status_audit', 'belum selesai')->isNotEmpty();

        // Dapatkan semua instrumen yang terkait dengan audit
        $instruments = InstrumenAudit::whereIn('id_AMI', $ami)->get();

        // Periksa apakah ada InstrumenAudit yang id_status_temuan-nya null
        $hasNullStatusTemuan = $instruments->whereNull('id_status_temuan')->isNotEmpty();

        // Jika tidak ada instrumen terkait dengan audit mutu internal, kembalikan pesan error
        if ($instruments->isEmpty()) {
            return redirect()->back()->with('error', 'Auditee Belum Melakukan Audit.');
        }

        // Jika ada status temuan yang null dan audit belum selesai, kembalikan pesan error
        if ($hasNullStatusTemuan && $hasUnfinishedAudit) {
            return redirect()->back()->with('error', 'Auditor Belum Mengaudit Semua Indikator');
        }

        // Jika semua pemeriksaan lolos, buat dan unduh PDF
        $pdf = PDF::loadView('lha.pdf', compact('instruments'))->setPaper('a4', 'portrait');

        return $pdf->download('Form LHA AMI Manajemen ' . $auditMutuInternals->first()->unit->nama . '.pdf');
    }





    public function adminIndikator(Request $request)
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

        return view('lha.adminIndikator', compact('instruments', 'units', 'tahuns', 'selectedUnit', 'selectedTA'));
    }

    // public function exportPDF1(Request $request)
    // {
    //     $selectedUnit = $request->input('select_unit');
    //     $selectedTA = $request->input('select_TA');

    //     $query = AuditMutuInternal::where('status_audit', 'selesai');

    //     if ($selectedUnit) {
    //         $query->where('id_unit', $selectedUnit);
    //     }

    //     if ($selectedTA) {
    //         $query->where('id_TA', $selectedTA);
    //     }

    //     $AuditID = $query->pluck('id');
    //     $instruments = InstrumenAudit::whereIn('id_AMI', $AuditID)->get();

    //     $pdf = PDF::loadView('lha.pdf', compact('instruments'))->setPaper('a4', 'portrait');

    //     return $pdf->download('Form LHA AMI Manajemen ' . $selectedUnit . '.pdf');
    // }
}
