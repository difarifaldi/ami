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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->unsignedBigInteger('id_unit')->nullable();
            $table->string('nip')->nullable();
            $table->string('status')->default('tidak aktif');
            $table->string('ttd')->nullable();
            $table->string('foto')->nullable();
            $table->string('forgot_password')->default('tidak')->nullable();
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('id_unit')->references('id')->on('units')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
