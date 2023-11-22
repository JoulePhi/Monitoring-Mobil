<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VehicleUsage extends Model
{

    use HasFactory;
    protected $table = 'vehicles_usage';
    protected $fillable = [
        'vehicle_id',
        'usage_date',
        'usage_count',
    ];
}
