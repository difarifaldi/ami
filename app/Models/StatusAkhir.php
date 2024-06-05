<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusAkhir extends Model
{
    use HasFactory;

    public function instrument()
    {
        $this->hasOne(InstrumenAudit::class, 'id_status_akhir');
    }
}
