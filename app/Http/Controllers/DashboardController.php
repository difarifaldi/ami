<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Models\InstrumenAudit;
use App\Models\StatusTemuan;
use App\Models\TahunAkademik;
use App\Models\Unit;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{

    public function index(Request $request)
    {
        $units = Unit::all();
        $selectedTA = $request->input('select_TA');
        $selectedUnit = $request->input('select_Unit');
        $tahuns = TahunAkademik::all();
        $statusInstrument = InstrumenAudit::all();

        // History
        $selectedUnit2 = $request->input('select_unit2');
        $statusHistory = InstrumenAudit::with(['ami', 'statusTemuan', 'indikator'])
            ->whereHas('ami', function ($query) use ($selectedUnit2) {
                $query->where('id_unit', $selectedUnit2);
            })
            ->get()
            ->groupBy(function ($item) {
                return $item->indikator->no;
            });

        if ($request->ajax()) {
            $dates = $statusHistory->flatMap(function ($instruments) {
                return $instruments->pluck('ami.tanggal');
            })->unique()->sort()->values();

            $data = $statusHistory->map(function ($instruments, $noIndikator) use ($dates) {
                return [
                    'noIndikator' => $noIndikator,
                    'instruments' => $dates->map(function ($date) use ($instruments) {
                        $instrument = $instruments->firstWhere('ami.tanggal', $date);
                        return [
                            'statusTemuan' => $instrument ? ($instrument->statusTemuan ? $instrument->statusTemuan->nama : '') : '',
                            'tanggal' => $date,
                        ];
                    })
                ];
            })->values();

            return response()->json([
                'dates' => $dates,
                'data' => $data
            ]);
        }


        return view('dashboard', compact('units', 'selectedTA', 'selectedUnit', 'tahuns', 'statusInstrument', 'selectedUnit2', 'statusHistory'));
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
        try {
            $unitId = $request->input('unit_id');
            Log::info('Selected Unit ID: ' . $unitId); // Log untuk debugging

            $statuses = StatusTemuan::all();

            // Mengambil semua tanggal unik dari tabel audit_mutu_internals yang sesuai dengan unit_id
            $dates = AuditMutuInternal::where('id_unit', $unitId)
                ->selectRaw('DATE(tanggal) as tanggal')
                ->groupBy('tanggal')
                ->orderBy('tanggal')
                ->get();

            Log::info('Dates retrieved: ' . $dates->toJson()); // Log untuk debugging

            $data = [];
            foreach ($dates as $date) {
                $dateData = [
                    'date' => $date->tanggal,
                    'data' => []
                ];
                foreach ($statuses as $status) {
                    $count = InstrumenAudit::whereHas('ami', function ($query) use ($date, $unitId) {
                        $query->whereDate('tanggal', $date->tanggal)->where('id_unit', $unitId);
                    })->where('id_status_temuan', $status->id)->count();
                    $dateData['data'][$status->nama] = $count;
                }
                $data[] = $dateData;
            }

            Log::info('Data processed: ' . json_encode($data)); // Log untuk debugging

            // Siapkan data untuk grafik
            $labels = $dates->pluck('tanggal')->map(function ($date) {
                return \Carbon\Carbon::parse($date)->format('Y-m-d');
            });
            $datasets = [];
            foreach ($statuses as $status) {
                $dataset = [
                    'label' => $status->nama,
                    'data' => [],
                    'borderColor' => $this->getRandomColor(),
                    'fill' => false
                ];
                foreach ($data as $dateData) {
                    $dataset['data'][] = $dateData['data'][$status->nama] ?? 0;
                }
                $datasets[] = $dataset;
            }

            $response = [
                'labels' => $labels,
                'datasets' => $datasets,
            ];

            Log::info('Response: ' . json_encode($response)); // Log untuk debugging

            return response()->json($response);
        } catch (Exception $e) {
            Log::error('Error fetching line chart data: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
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


    // public function fetchLineChartData1(Request $request)
    // {
    //     $unitId = $request->input('unit_id');
    //     Log::info('Selected Unit ID: ' . $unitId); // Log untuk debugging

    //     $years = TahunAkademik::all();
    //     $statuses = StatusTemuan::all();

    //     $data = [];
    //     foreach ($years as $year) {
    //         $yearData = [
    //             'year' => $year->nama,
    //             'data' => []
    //         ];
    //         foreach ($statuses as $status) {
    //             $count = InstrumenAudit::whereHas('ami', function ($query) use ($year, $unitId) {
    //                 $query->where('id_TA', $year->id)->where('id_unit', $unitId);
    //             })->where('id_status_temuan', $status->id)->count();
    //             $yearData['data'][$status->nama] = $count;
    //         }
    //         $data[] = $yearData;
    //     }

    //     // Siapkan data untuk grafik
    //     $labels = $years->pluck('nama');
    //     $datasets = [];
    //     foreach ($statuses as $status) {
    //         $dataset = [
    //             'label' => $status->nama,
    //             'data' => [],
    //             'borderColor' => $this->getRandomColor(),
    //             'fill' => false
    //         ];
    //         foreach ($data as $yearData) {
    //             $dataset['data'][] = $yearData['data'][$status->nama] ?? 0;
    //         }
    //         $datasets[] = $dataset;
    //     }

    //     $response = [
    //         'labels' => $labels,
    //         'datasets' => $datasets,
    //     ];

    //     Log::info('Response: ' . json_encode($response)); // Log untuk debugging

    //     return response()->json($response);
    // }
}
