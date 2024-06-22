<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\StatusTemuan;
use App\Models\TahunAkademik;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $selectedTA = $request->input('select_TA');
        $selectedUnit = $request->input('select_Unit');
        $tahuns = TahunAkademik::all();
        $statusInstrument = InstrumenAudit::all();
        $units = Unit::all();
        return view('dashboard', compact('tahuns', 'units', 'statusInstrument', 'selectedTA', 'selectedUnit'));
    }

    public function fetchStatusTemuanData(Request $request)
    {
        $selectedTA = $request->input('select_TA');
        $unitId = $request->input('unit_id');
        Log::info('Selected TA: ' . $selectedTA); // Log untuk debugging
        Log::info('Selected Unit ID: ' . $unitId); // Log untuk debugging

        // Ambil instrumen audit berdasarkan tahun akademik dan unit yang dipilih
        $instrumenAudits = InstrumenAudit::whereHas('ami', function ($query) use ($selectedTA, $unitId) {
            $query->where('id_TA', $selectedTA)->where('id_unit', $unitId);
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
    public function fetchLineChartData(Request $request)
    {
        $unitId = $request->input('unit_id');
        Log::info('Selected Unit ID: ' . $unitId); // Log untuk debugging

        $years = TahunAkademik::all();
        $statuses = StatusTemuan::all();

        $data = [];
        foreach ($years as $year) {
            $yearData = [
                'year' => $year->nama,
                'data' => []
            ];
            foreach ($statuses as $status) {
                $count = InstrumenAudit::whereHas('ami', function ($query) use ($year, $unitId) {
                    $query->where('id_TA', $year->id)->where('id_unit', $unitId);
                })->where('id_status_temuan', $status->id)->count();
                $yearData['data'][$status->nama] = $count;
            }
            $data[] = $yearData;
        }

        // Siapkan data untuk grafik
        $labels = $years->pluck('nama');
        $datasets = [];
        foreach ($statuses as $status) {
            $dataset = [
                'label' => $status->nama,
                'data' => [],
                'borderColor' => $this->getRandomColor(),
                'fill' => false
            ];
            foreach ($data as $yearData) {
                $dataset['data'][] = $yearData['data'][$status->nama] ?? 0;
            }
            $datasets[] = $dataset;
        }

        $response = [
            'labels' => $labels,
            'datasets' => $datasets,
        ];

        Log::info('Response: ' . json_encode($response)); // Log untuk debugging

        return response()->json($response);
    }

    private function getRandomColor()
    {
        $letters = '0123456789ABCDEF';
        $color = '#';
        for ($i = 0; $i < 6; $i++) {
            $color .= $letters[rand(0, 15)];
        }
        return $color;
    }
}
