<?php

namespace App\Exports;

use App\Models\Reservation;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;

class ReservationExport implements FromCollection
{

    public function collection()
    {
        $reservations = Reservation::with(['user', 'vehicle', 'driver', 'approval1data', 'approval2data'])->orderBy('created_at')->get();

        $data = [];
        $title = [
            'id' => 'id',
            'user' => 'User',
            'vehicle' => 'Vehicle',
            'fuel_consumption' => 'Fuel Consumption / L',
            'driver' =>  'Driver',
            'approval1_name' => 'Approval 1',
            'approval1_status' => 'Approval 1 Status',
            'approval2_name' => 'Approval 2',
            'approval2_status' => 'Approval 2 Status',
            'status' => 'Reservation Status',
            'reservation_date' => 'Reservation Date',
            'done_at' => 'Done At'
        ];
        array_push($data, $title);
        foreach ($reservations as $reservation) {
            $temp = [
                'id' => $reservation->id,
                'user' => $reservation->user->name,
                'vehicle' => $reservation->vehicle->name,
                'fuel_consumption' => $reservation->vehicle->fuel_consumption,
                'driver' => $reservation->driver->name,
                'approval1_name' => $reservation->approval1data->name,
                'approval1_status' => $reservation->aprroval1,
                'approval2_name' => $reservation->approval2data->name,
                'approval2_status' => $reservation->aprroval2,
                'status' => $reservation->status,
                'reservation_date' => $reservation->reservation_date,
                'done_at' => $reservation->is_done
            ];
            array_push($data, $temp);
        }

        Log::debug($data);

        return collect($data);
    }
}
