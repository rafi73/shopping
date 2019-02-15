<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
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
            'customer' => $this->customer,
            'total' => $this->total,
            'customer_name' => $this->customer->name,
            'customer_email' => $this->customer->email,
            'billing_name' => $this->billing_name,
            'billing_phone' => $this->billing_phone,
            'billing_company' => $this->billing_company,
            'billing_country' => $this->billing_country,
            'billing_state' => $this->billing_state,
            'billing_address' => $this->billing_address,
            'shipping_name' => $this->shipping_name,
            'shipping_phone' => $this->shipping_phone,
            'shipping_company' => $this->shipping_company,
            'shipping_country' => $this->shipping_country,
            'shipping_state' => $this->shipping_state,
            'shipping_address' => $this->shipping_address,
            'created_at' => $this->created_at->format('Y-m-d H:i:s A'),
            'orderDetails' => $this->orderDetails,
            
        ];
    }
    public function with($request) {
        return [
            'version' => '1.0.0'
        ];
    }
}
