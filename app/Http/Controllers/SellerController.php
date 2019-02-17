<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Seller;
use App\Http\Resources\SellerResource;

class SellerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Sellers
        $sellers = Seller::orderBy('created_at', 'desc')->paginate(10);

        // Return collection of Sellers as a resource
        return SellerResource::collection($sellers);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $seller = $request->isMethod('put') ? Seller::findOrFail($request->id) : new Seller;

        $seller->name= $request->input('name');
        $seller->email= $request->input('email');
        $seller->company= $request->input('company');
        $seller->contact= $request->input('contact');
        $seller->active= $request->input('active');
        $seller->created_by= $request->input('created_by');
        $seller->updated_by= $request->input('updated_by');
        if($seller->save()) 
        {
            return new SellerResource($seller);
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
        // Get Sellers
        $seller = Seller::findOrFail($id);

        // Return single Sellers as a resource
        return new SellerResource($seller);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Sellers
        $seller = Seller::findOrFail($id);

        if($seller->delete()) 
        {
            return new SellerResource($seller);
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
        // Get Sellers   
        $query = Seller::where(function ($query) use($search) {
                            $query->where('name', 'like', '%' . $search . '%')
                            ->orWhere('email', 'like', '%' . $search . '%')
                            ->orWhere('company', 'like', '%' . $search . '%')
                            ->orWhere('contact', 'like', '%' . $search . '%');
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        $sellers = $query->paginate($rowsPerPage);

        // Return collection of Sellers as a resource
        return SellerResource::collection($sellers);
    }
}
