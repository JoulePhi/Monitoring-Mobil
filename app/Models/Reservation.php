<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'driver_id',
        'vehicle_id',
        'status',
        'reservation_date',
        'aprroval1',
        'aprroval2',
        'approval1_id',
        'approval2_id',
        'is_done',
    ];


    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
    public function driver(): HasOne
    {
        return $this->hasOne(Driver::class, 'id', 'driver_id');
    }
    public function vehicle(): HasOne
    {
        return $this->hasOne(Vehicle::class, 'id', 'vehicle_id');
    }
    public function approval1data(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'approval1_id');
    }
    public function approval2data(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'approval2_id');
    }
}
