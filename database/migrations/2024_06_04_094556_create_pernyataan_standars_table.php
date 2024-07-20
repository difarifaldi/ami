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
        Schema::create('pernyataan_standars', function (Blueprint $table) {
            $table->id();
            $table->string('no_ps')->nullable();
            $table->text('pernyataan_standar')->nullable();
            $table->unsignedBigInteger('id_unit')->nullable();
            $table->string('status')->default('aktif')->nullable();

            $table->foreign('id_unit')->references('id')->on('units')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pernyataan_standars');
    }
};
