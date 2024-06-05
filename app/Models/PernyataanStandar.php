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
}
