<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TahunAkademik extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function tahunAudit()
    {
        return $this->hasMany(AuditMutuInternal::class, 'id_TA');
    }
}
