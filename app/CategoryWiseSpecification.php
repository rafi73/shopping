<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryWiseSpecification extends Model
{
    public function specification()
    {
        return $this->belongsTo(Specification::class);
    } 
}
