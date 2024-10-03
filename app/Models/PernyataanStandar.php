<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PernyataanStandar extends Model
{
    use HasFactory;
    protected $guarded = [''];

    public function indikator()
    {
        return $this->hasMany(Indikator::class, 'id_pernyataan');
    }
    public function unit()
    {
        return $this->belongsTo(Unit::class, 'id_unit');
    }
    public function tahunAkademik()
    {
        return $this->belongsTo(TahunAkademik::class, 'id_TA');
    }
}
