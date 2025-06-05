<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;

    protected $guarded = [''];

    public function user()
    {
        return $this->hasMany(User::class, 'id_unit');
    }
    public function auditMutu()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_unit');
    }
    public function pernyataan()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_unit');
    }

    public function children()
    {
        return $this->hasMany(Unit::class, 'id_parent');
    }
    public function parent()
    {
        return $this->belongsTo(Unit::class, 'id_parent');
    }
}
