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
            $table->text('deskripsi_temuan')->nullable();
            $table->string('bukti')->nullable();
            $table->text('akar_penyebab')->nullable();
            $table->text('akibat')->nullable();
            $table->text('temuan_audit')->nullable();
            $table->text('rekomendasi_auditor')->nullable();
            $table->text('penanggung_jawab')->nullable();
            $table->text('rencana_perbaikan')->nullable();
            $table->text('tanggapan_auditee')->nullable();
            $table->date('jadwal_penyelesaian')->nullable();
            $table->string('link')->nullable();
            $table->unsignedBigInteger('id_status_tercapai')->nullable();
            $table->unsignedBigInteger('id_status_temuan')->nullable();
            $table->unsignedBigInteger('id_status_akhir')->nullable();
            $table->unsignedBigInteger('id_AMI')->nullable();
            $table->unsignedBigInteger('id_indikator')->nullable();
            $table->string('status_audit')->default('belum selesai')->nullable();
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
