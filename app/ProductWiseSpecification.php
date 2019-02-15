<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductWiseSpecification extends Model
{
    public function specification()
    {
        return $this->belongsTo(Specification::class);
    } 
}
