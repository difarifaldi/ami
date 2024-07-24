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
        Schema::create('indikators', function (Blueprint $table) {
            $table->id();
            $table->string('no')->nullable();
            $table->text('indikator')->nullable();
            $table->unsignedBigInteger('id_pernyataan')->nullable();
            $table->timestamps();

            $table->foreign('id_pernyataan')->references('id')->on('pernyataan_standars')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('indikators');
    }
};
