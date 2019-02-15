<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Purchase;
use App\Http\Resources\PurchaseResource;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Purchases
        $purchases = Purchase::orderBy('created_at', 'desc')->paginate(10);

        // Return collection of Purchases as a resource
        return PurchaseResource::collection($purchases);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $purchase = $request->isMethod('put') ? Purchase::findOrFail($request->id) : new Purchase;

        $purchase->product_id= $request->input('product_id');
        $purchase->email= $request->input('cost');
        $purchase->selling_price= $request->input('selling_price');
        $purchase->seller_id= $request->input('seller_id');
        $purchase->active= $request->input('active');
        $purchase->created_by= $request->input('created_by');
        $purchase->updated_by= $request->input('updated_by');
        if($purchase->save()) 
        {
            return new PurchaseResource($purchase);
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
        // Get Purchases
        $purchase = Purchase::findOrFail($id);

        // Return single Purchases as a resource
        return new PurchaseResource($purchase);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Purchases
        $purchase = Purchase::findOrFail($id);

        if($purchase->delete()) 
        {
            return new PurchaseResource($purchase);
        }    
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getDatatable()
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
        // Get Purchases   
        $query = Purchase::where(function ($query) use($search) {
                            $query->where('name', 'like', '%' . $search . '%')
                            ->orWhere('description', 'like', '%' . $search . '%');
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        $purchases = $query->paginate($rowsPerPage);

        // Return collection of Purchases as a resource
        return PurchaseResource::collection($purchases);
    }
}
