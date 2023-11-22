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
        Schema::table('reservations', function (Blueprint $table) {
            $table->enum('aprroval1', ['aprroved', 'rejected', 'pending'])->default('pending')->change();
            $table->enum('aprroval2', ['aprroved', 'rejected', 'pending'])->default('pending')->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->boolean('aprroval1')->default(false)->change();
            $table->boolean('aprroval2')->default(false)->change();
        });
    }
};
