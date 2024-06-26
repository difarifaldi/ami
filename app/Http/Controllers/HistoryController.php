<?php

namespace App\Http\Controllers;

use App\Models\InstrumenAudit;
use App\Models\Unit;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        $selectedUnit = $request->input('select_unit');
        $units = Unit::all();

        // Ambil data instrumen audit untuk unit yang dipilih
        $statusInstrument = InstrumenAudit::with(['ami', 'statusTemuan', 'indikator'])
            ->whereHas('ami', function ($query) use ($selectedUnit) {
                $query->where('id_unit', $selectedUnit);
            })
            ->get()
            ->groupBy(function ($item) {
                return $item->indikator->no;
            });

        return view('history.index', compact('statusInstrument', 'units', 'selectedUnit'));
    }
}
