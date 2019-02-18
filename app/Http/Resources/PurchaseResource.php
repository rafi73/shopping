<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PurchaseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'product_id' => $this->product_id,
            'cost_price' => $this->cost_price,
            'selling_price' => $this->selling_price,
            'seller_id' => $this->seller_id,
            'active' => $this->active == 1 ? true : false,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at->format('Y-m-d H:i:s A'),
            'updated_at' => $this->updated_at->format('Y-m-d'),
            'product' => $this->product,
            'seller' => $this->seller,
        ];
    }
    public function with($request) {
        return [
            'version' => '1.0.0'
        ];
    }
}
