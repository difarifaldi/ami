<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\Unit;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        $units = Unit::all();

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

        return view('history.index', compact('statusHistory', 'units', 'selectedUnit2'));
    }
}
