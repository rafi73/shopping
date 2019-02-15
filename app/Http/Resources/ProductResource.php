<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'name' => $this->name,
            'category' => $this->category,
            'category_id' => $this->category_id,
            'sub_category_id' => $this->sub_category_id,
            'brand_id' => $this->brand_id,
            'description' => $this->description,
            'image' => $this->image,
            'reference' => $this->reference,
            'condition' => $this->condition,
            'price' => $this->price,
            'discount_price' => $this->discount_price,
            'quantity' => 1,
            'more_info' => $this->more_info,
            'inside_box' => $this->inside_box,
            'active' => $this->active == 1 ? true : false,
            'new' => $this->new == 1 ? true : false,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at->format('Y-m-d H:i:s A'),
            'updated_at' => $this->updated_at->format('Y-m-d'),
        ];
    }
    public function with($request) {
        return [
            'version' => '1.0.0'
        ];
    }
}
