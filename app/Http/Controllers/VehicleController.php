<?php

namespace App\Http\Controllers;

use App\Models\Vehicle;
use Illuminate\Http\Request;
use Inertia\Inertia;

class VehicleController extends Controller
{
    public function index()
    {
        $vehicles = Vehicle::all();

        return Inertia::render('Vehicle', [
            'vehicles' => $vehicles,
        ]);
    }
}
