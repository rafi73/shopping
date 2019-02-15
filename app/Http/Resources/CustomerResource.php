<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerResource extends JsonResource
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
            'email' => $this->email,
            'phone' => $this->phone,
            'company' => $this->company,
            'country' => $this->country,
            'state' => $this->state,
            'address' => $this->address,
            'is_dealer' => $this->is_dealer == 1 ? true : false,
            'active' => $this->active == 1 ? true : false,
            'created_at' => $this->created_at->format('Y-m-d H:i:s A'),
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s A'),
        ];
    }
    public function with($request) {
        return [
            'version' => '1.0.0'
        ];
    }
}
