<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    public function product()
    {
        return $this->belongsTo(Product::class);
    } 

    public function seller()
    {
        return $this->belongsTo(Seller::class);
    } 
}
