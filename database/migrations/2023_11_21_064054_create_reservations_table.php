<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->bigInteger('driver_id');
            $table->bigInteger('vehicle_id');
            $table->boolean('aprroval1')->default(false);
            $table->boolean('aprroval2')->default(false);
            $table->enum('status', ['pending', 'approved', 'rejected']);
            $table->dateTime('reservation_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};
