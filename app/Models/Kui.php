<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kui extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = "kui_instruments";

    public function statusTemuan()
    {
        return $this->belongsTo(StatusTemuan::class, 'id_status_temuan');
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
