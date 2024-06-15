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
        Schema::create('instrumen_audits', function (Blueprint $table) {
            $table->id();
            $table->string('deskripsi_temuan')->nullable();
            $table->string('bukti')->nullable();
            $table->string('akar_penyebab')->nullable();
            $table->string('akibat')->nullable();
            $table->string('temuan_audit')->nullable();
            $table->string('rekomendasi_auditor')->nullable();
            $table->string('penanggung_jawab')->nullable();
            $table->string('rencana_perbaikan')->nullable();
            $table->string('tanggapan_auditee')->nullable();
            $table->date('jadwal_penyelesaian')->nullable();
            $table->string('link')->nullable();
            $table->unsignedBigInteger('id_status_tercapai')->nullable();
            $table->unsignedBigInteger('id_status_temuan')->nullable();
            $table->unsignedBigInteger('id_status_akhir')->nullable();
            $table->unsignedBigInteger('id_AMI')->nullable();
            $table->unsignedBigInteger('id_indikator')->nullable();
            $table->string('status_audit')->nullable();
            $table->timestamps();

            $table->foreign('id_status_tercapai')->references('id')->on('status_tercapais')->onDelete('cascade');
            $table->foreign('id_status_temuan')->references('id')->on('status_temuans')->onDelete('cascade');
            $table->foreign('id_status_akhir')->references('id')->on('status_akhirs')->onDelete('cascade');
            $table->foreign('id_AMI')->references('id')->on('audit_mutu_internals')->onDelete('cascade');
            $table->foreign('id_indikator')->references('id')->on('indikators')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instrumen_audits');
    }
};
