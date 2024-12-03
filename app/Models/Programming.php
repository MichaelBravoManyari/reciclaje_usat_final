<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Programming extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function vehicleroutes()
    {
        return $this->hasMany(Vehicleroute::class, 'programming_id');
    }
}
