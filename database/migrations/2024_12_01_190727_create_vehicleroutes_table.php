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
        Schema::create('vehicleroutes', function (Blueprint $table) {
            $table->id();
            $table->date("date_route");
            $table->time("time_route");
            $table->text("description")->nullable();
            $table->unsignedBigInteger("vehicle_id");
            $table->unsignedBigInteger("route_id");
            $table->unsignedBigInteger("schedule_id");
            $table->unsignedBigInteger('routestatus_id');
            $table->unsignedBigInteger('programming_id');
            $table->foreign("vehicle_id")->references("id")->on("vehicles");
            $table->foreign("route_id")->references("id")->on("routes");
            $table->foreign("schedule_id")->references("id")->on("schedules");
            $table->foreign('routestatus_id')->references('id')->on('routestatus');
            $table->foreign('programming_id')->references('id')->on('programmings');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vehicleroutes');
    }
};
