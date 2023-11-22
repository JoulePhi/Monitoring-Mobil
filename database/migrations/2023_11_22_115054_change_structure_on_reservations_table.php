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
            $table->bigInteger('approval1_id')->change()->after('aprroval2');
            $table->bigInteger('approval2_id')->change()->after('approval1_id');
            $table->dateTime('is_done')->nullable()->change()->after('reservation_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->bigInteger('approval1_id')->change()->after('updated_at');
            $table->bigInteger('approval2_id')->change()->after('approval1_id');
            $table->boolean('is_done')->change()->after('approval2_id');
        });
    }
};
