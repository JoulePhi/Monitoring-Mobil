<?php

namespace App\Http\Middleware;

use App\Models\Driver;
use App\Models\User;
use App\Models\Vehicle;
use Carbon\Carbon;
use Inertia\Middleware;
use Tightenco\Ziggy\Ziggy;
use App\Models\VehicleUsage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        $users = User::count();
        $drivers = Driver::count();
        $availableDriver = Driver::where('is_available', true)->count();
        $vehicles = Vehicle::count();
        $vehiclesAvailable = Vehicle::where('is_available', true)->count();
        $totalFuel = Vehicle::sum('fuel_consumption');
        return [
            ...parent::share($request),
            'auth' => [
                'user' => $request->user(),
            ],
            'stats' => [
                'users' => $users,
                'drivers' => [
                    'available' => $availableDriver,
                    'total' => $drivers,
                ],
                'vehicles' => [
                    'available' => $vehiclesAvailable,
                    'total' => $vehicles,
                ],
                'fuel' => $totalFuel
            ],
            'csrf' => csrf_token(),
            'ziggy' => fn () => [
                ...(new Ziggy)->toArray(),
                'location' => $request->url(),
            ],
        ];
    }
}
