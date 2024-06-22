<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\StatusTemuan;
use App\Models\TahunAkademik;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $selectedTA = $request->input('select_TA');
        $tahuns = TahunAkademik::all();
        return view('dashboard', compact('tahuns', 'selectedTA'));
    }

    public function fetchStatusTemuanData(Request $request)
    {
        $selectedTA = $request->input('select_TA');
        Log::info('Selected TA: ' . $selectedTA); // Log untuk debugging

        // Ambil instrumen audit berdasarkan tahun akademik yang dipilih
        $instrumenAudits = InstrumenAudit::whereHas('ami', function ($query) use ($selectedTA) {
            $query->where('id_TA', $selectedTA);
        })->get();

        // Hitung jumlah status temuan berdasarkan nama status
        $statusTemuans = [];
        foreach ($instrumenAudits as $instrumen) {
            $status = $instrumen->statusTemuan;
            if ($status) {
                $key = $status->nama; // Menggunakan kolom nama dari tabel status_temuan
                if (!isset($statusTemuans[$key])) {
                    $statusTemuans[$key] = 0;
                }
                $statusTemuans[$key]++;
            }
        }

        // Siapkan data untuk grafik
        $labels = array_keys($statusTemuans);
        $values = array_values($statusTemuans);

        $response = [
            'labels' => $labels,
            'values' => $values,
        ];

        Log::info('Response: ' . json_encode($response)); // Log untuk debugging

        return response()->json($response);
    }
}
