<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\User;
use Inertia\Inertia;
use App\Models\Driver;
use App\Models\Vehicle;
use App\Models\Reservation;
use Illuminate\Support\Str;
use App\Models\VehicleUsage;
use Illuminate\Http\Request;
use App\Exports\ReservationExport;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Redirect;

class ReservationController extends Controller
{


    public function index()
    {
        $vehicles = Vehicle::where('is_available', true)->get();
        $users = User::where('role', 'USER')->get();
        $approvals = User::where('role', 'APPROVAL')->get();
        $drivers = Driver::where('is_available', true)->get();
        $reservations = Reservation::with(['user', 'driver', 'vehicle'])->get();
        return Inertia::render('Reservation', [
            'vehicles' => $vehicles,
            'users' => $users,
            'drivers' => $drivers,
            'reservations' => $reservations,
            'approvals' => $approvals
        ]);
    }

    public function reserve(Request $request)
    {

        $request->validate([
            'user' => 'required',
            'driver' => 'required',
            'vehicle' => 'required',
        ]);

        if ($request->approval1_id == $request->approval2_id) {
            return Redirect::back()->withErrors(['approval' => 'Approvals cannot be same']);
        }

        Reservation::create([
            'user_id' => $request->user,
            'driver_id' => $request->driver,
            'vehicle_id' => $request->vehicle,
            'status' => 'pending',
            'approval1_id' => $request->approval1_id,
            'approval2_id' => $request->approval2_id,
            'reservation_date' => Carbon::now(),
        ]);

        $vehicle = Vehicle::find($request->vehicle);
        $driver = Driver::find($request->driver);

        $vehicle->update([
            'is_available' => false
        ]);
        $driver->update([
            'is_available' => false
        ]);

        $vehicle = VehicleUsage::where('usage_date', Carbon::now()->format('Y-m-d'))->first();
        Log::debug(Carbon::now()->format('Y-m-d'));
        if ($vehicle) {
            $vehicle->update([
                'usage_count' => $vehicle->usage_count + 1
            ]);
        } else {
            VehicleUsage::create([
                'vehicle_id' => $request->vehicle,
                'usage_date' =>  Carbon::now()->format('Y-m-d'),
                'usage_count' =>  1,
            ]);
        }

        Log::debug($vehicle);
        return redirect()->route('reservation.index');
    }


    public function done(Request $request)
    {
        $reservation = Reservation::with(['driver', 'vehicle'])->find($request->id);
        $reservation->update([
            'is_done' => Carbon::now(),
        ]);

        $reservation->driver->update([
            'is_available' => true,
        ]);
        $reservation->vehicle->update([
            'is_available' => true,
            'fuel_consumption' => $reservation->vehicle->fuel_consumption  + rand(1, 100),
        ]);

        return redirect()->route('reservation.index');
    }

    public function export()
    {
        return Excel::download(new ReservationExport, 'reports' . Carbon::now() . '.xlsx');
    }
}
