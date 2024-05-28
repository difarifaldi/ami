<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\RequestFood;
use App\Models\RequestFood1;
use App\Models\RequestFood2;
use App\Models\RequestFood3;
use App\Models\RequestFood4;
use App\Models\RequestFood5;

class DashboardController extends Controller
{
    public function index()
    {
        $currentTime = Carbon::now();
        
        // Dapatkan total overtime dan undertime berdasarkan waktu saat ini
        $totalOvertime =  0;        
        $totalOvertime1 = 0;
        $totalOvertime2 = 0;
        $totalOvertime3 = 0;
        $totalOvertime4 = 0;
        $totalOvertime5 = 0;

        // Kirim waktu saat ini, total overtime, dan total undertime ke view dashboard
        return view('dashboard', compact('currentTime', 'totalOvertime', 'totalOvertime1', 'totalOvertime2', 'totalOvertime3', 'totalOvertime4', 'totalOvertime5'));
    }

}
