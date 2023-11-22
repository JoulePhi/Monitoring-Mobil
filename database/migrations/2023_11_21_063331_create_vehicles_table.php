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
        Schema::create('vehicles', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('license_plate');
            $table->string('image');
            $table->enum('type', ['angkutan_orang', 'angkutan_barang']);
            $table->enum('owner', ['perusahaan', 'penyewaan']);
            $table->double('fuel_consumption', 5, 2);
            $table->dateTime('service_schedule');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vehicles');
    }
};
