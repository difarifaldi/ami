<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusTemuan extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function instrument()
    {
        return $this->hasMany(InstrumenAudit::class, 'id_status_temuan');
    }
}
