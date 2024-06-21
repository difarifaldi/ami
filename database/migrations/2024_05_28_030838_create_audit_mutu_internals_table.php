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
        Schema::create('audit_mutu_internals', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_unit')->nullable();
            $table->unsignedBigInteger('id_user_auditee')->nullable();
            $table->unsignedBigInteger('id_user_auditor_ketua')->nullable();
            $table->unsignedBigInteger('id_user_auditor_anggota1')->nullable();
            $table->unsignedBigInteger('id_user_auditor_anggota2')->nullable();
            $table->unsignedBigInteger('id_user_manajemen')->nullable();
            $table->unsignedBigInteger('id_user_admin')->nullable();
            $table->dateTime('tanggal')->nullable();
            $table->unsignedBigInteger('id_TA')->nullable();
            $table->string('status_audit')->default('belum selesai')->nullable();
            $table->timestamps();

            $table->foreign('id_unit')->references('id')->on('units')->onDelete('cascade');
            $table->foreign('id_user_auditee')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_user_auditor_ketua')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_user_auditor_anggota1')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_user_auditor_anggota2')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_user_manajemen')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_user_admin')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_TA')->references('id')->on('tahun_akademiks')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('audit_mutu_internals');
    }
};
