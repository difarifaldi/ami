<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuditMutuInternal extends Model
{
    use HasFactory;
    protected $guarded = [''];

    public function unit()
    {
        return $this->belongsTo(Unit::class, 'id_unit');
    }
    public function auditee()
    {
        return $this->belongsTo(User::class, 'id_user_auditee');
    }
    public function auditorKetua()
    {
        return $this->belongsTo(User::class, 'id_user_auditor_ketua');
    }
    public function auditorAnggota1()
    {
        return $this->belongsTo(User::class, 'id_user_auditor_anggota1');
    }
    public function auditorAnggota2()
    {
        return $this->belongsTo(User::class, 'id_user_auditor_anggota2');
    }
    public function manajemen()
    {
        return $this->belongsTo(User::class, 'id_user_manajemen');
    }
    public function admin()
    {
        return $this->belongsTo(User::class, 'id_user_admin');
    }
}
