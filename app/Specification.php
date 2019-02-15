<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Specification extends Model
{
    public function categoryWiseSpecification()
    {
        $this->hasMany(CategoryWiseSpecification::class);
    }
}
