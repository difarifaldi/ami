<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'status',
        'id_unit',
        'nip',
        'ttd',
        'foto',
        'forgot_password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function unit()
    {
        return $this->belongsTo(Unit::class, 'id_unit');
    }

    public function recordLogin()
    {
        return $this->hasMany(RecordLogin::class, 'user_id');
    }

    public function auditAsAuditee()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_auditee');
    }
    public function auditAsAdmin()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_admin');
    }
    public function auditAsAuditorKetua()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_auditor_ketua');
    }
    public function auditAsAuditorAnggota1()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_auditor_anggota1');
    }
    public function auditAsAuditorAnggota2()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_auditor_anggota2');
    }
    public function auditAsManajemen()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_user_manajemen');
    }
}
