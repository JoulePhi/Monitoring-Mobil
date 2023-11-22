<?php

namespace App\Http\Controllers;

use App\Models\VehicleUsage;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {


        return Inertia::render('Dashboard');
    }


    public function getData(Request $request, $week = 1)
    {
        $startDate = Carbon::now()->subDays(7 * $week);
        $endDate = Carbon::now()->subDays((7 * $week) - 7);
        $usageData = VehicleUsage::whereBetween('usage_date', [$startDate, $endDate])
            ->groupBy('usage_date')
            ->orderBy('usage_date')
            ->get([
                DB::raw('Date(usage_date) as date'),
                DB::raw('SUM(usage_count) as total_count'),
            ]);
        Log::debug($usageData);
        return response()->json($usageData);
    }
}
