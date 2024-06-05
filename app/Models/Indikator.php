<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Indikator extends Model
{
    use HasFactory;
    protected $guarded = [''];


    public function pernyataan()
    {
        return $this->belongsTo(PernyataanStandar::class, 'id_pernyataan');
    }
    public function instrument()
    {
        return $this->hasMany(InstrumenAudit::class, 'id_indikator');
    }
}
