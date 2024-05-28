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
        Schema::create('ketercapaian_standars', function (Blueprint $table) {
            $table->id();
            $table->string('no_ps')->nullable();
            $table->text('pernyataan_standar')->nullable();
            $table->string('no')->nullable();
            $table->text('indikator')->nullable();
            $table->string('keadaan')->nullable();
            $table->string('bukti')->nullable();
            $table->string('temuan')->nullable();
            $table->string('rekomendasi')->nullable();
            $table->string('penanggung_jawab')->nullable();
            $table->string('important')->nullable();
            $table->string('urgen')->nullable();
            $table->string('rencana')->nullable();
            $table->string('link')->nullable();
            $table->unsignedBigInteger('id_status_tercapai')->nullable();
            $table->unsignedBigInteger('id_status_temuan')->nullable();
            $table->unsignedBigInteger('id_status_akhir')->nullable();
            $table->unsignedBigInteger('id_AMI')->nullable();
            $table->timestamps();

            $table->foreign('id_status_tercapai')->references('id')->on('status_tercapais')->onDelete('cascade');
            $table->foreign('id_status_temuan')->references('id')->on('status_temuans')->onDelete('cascade');
            $table->foreign('id_status_akhir')->references('id')->on('status_akhirs')->onDelete('cascade');
            $table->foreign('id_AMI')->references('id')->on('status_akhirs')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ketercapaian_standars');
    }
};
