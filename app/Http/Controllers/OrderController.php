<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\OrderDetail;
use App\Product;
use App\Http\Resources\OrderResource;

class OrderController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sortBy = \Request::get('sortBy');
        $rowsPerPage = \Request::get('rowsPerPage');
        $search = \Request::get('search');

        switch (\Request::get('descending')) 
        {
            case 'null':
                $sortType = null;
                break;
            case 'true':
                $sortType = 'desc';
                break;
            case 'false':
                $sortType = 'asc';
                break;
        }
        // Get Brands   
        $query = Order::with(['orderDetails', 'orderDetails.product'])
                        ->where(function ($query) use($search) {
                            $query->where('billing_name', 'like', '%' . $search . '%')
                            ->orWhere('shipping_name', 'like', '%' . $search . '%');
                        });
        $orders = $query->paginate($rowsPerPage);

        // Return collection of Brands as a resource
        return OrderResource::collection($orders);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $order = new Order;
        $order->customer_id= $request->input('customer_id');
        $order->discount= 0;
        $order->total= $request->input('total');
        $order->vat= $request->input('vat');
        $order->billing_name= $request->input('billing')['name'];
        $order->billing_email= $request->input('billing')['email'];
        $order->billing_phone= $request->input('billing')['phone'];
        $order->billing_company= $request->input('billing')['company'];
        $order->billing_country= $request->input('billing')['country'];
        $order->billing_state= $request->input('billing')['state'];
        $order->billing_address= $request->input('billing')['address'];
        $order->shipping_name= $request->input('billing')['name'];
        $order->shipping_email= $request->input('billing')['email'];
        $order->shipping_phone= $request->input('billing')['phone'];
        $order->shipping_company= $request->input('billing')['company'];
        $order->shipping_country= $request->input('billing')['country'];
        $order->shipping_state= $request->input('billing')['state'];
        $order->shipping_address= $request->input('billing')['address'];
        $order->active= true;

        if($order->save()) 
        {
            $orderDetails = $request->input('details');
            foreach ($orderDetails as $key => $value) 
            {
                $product = Product::findOrFail($value['id']);
                $orderDetail = new OrderDetail;
                $orderDetail->order_id = $order->id;
                $orderDetail->product_id = $product->id;
                $orderDetail->stock_id = 0;
                $orderDetail->quantity = $value['quantity'];
                $orderDetail->cost_price = 0;
                $orderDetail->selling_price = $product->price;
                $orderDetail->discount_price = $product->discount_price;
                $orderDetail->save();
            }
            return new OrderResource($order);
        }
    }


    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Get Orders
        $order = Order::with(array('orderDetails', 'orderDetails.product'))->findOrFail($id);

        // Return single Orders as a resource
        return new OrderResource($order);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Orders
        $order = Order::findOrFail($id);

        if($order->delete()) 
        {
            return new OrderResource($order);
        }    
    }
}
