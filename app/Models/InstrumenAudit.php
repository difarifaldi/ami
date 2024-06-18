<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InstrumenAudit extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function statusTemuan()
    {
        return $this->belongsTo(StatusTemuan::class, 'id_status_temuan');
    }

    public function ami()
    {
        return $this->belongsTo(AuditMutuInternal::class, 'id_AMI');
    }
    public function indikator()
    {
        return $this->belongsTo(Indikator::class, 'id_indikator');
    }
    public function statusTercapai()
    {
        return $this->belongsTo(StatusTercapai::class, 'id_status_tercapai');
    }
    public function statusAkhir()
    {
        return $this->belongsTo(StatusAkhir::class, 'id_status_akhir');
    }
}
