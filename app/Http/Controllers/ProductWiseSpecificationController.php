<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductWiseSpecification;
use App\Specification;
use App\Http\Resources\ProductWiseSpecificationResouerce;
class ProductWiseSpecificationController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Categorys
        $productWiseSpecifications = ProductWiseSpecification::orderBy('created_at', 'desc')->Where('active', 1)->paginate(100);

        // Return collection of Categorys as a resource
        return ProductWiseSpecificationResouerce::collection($productWiseSpecifications);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->input('data');
        if(count($data))
        {
            ProductWiseSpecification::where('category_id',$data[0]['category_id'])->delete();
        }
        ProductWiseSpecification::insert($request->input('data'));
    }
    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Get Categorys
        $productWiseSpecification = ProductWiseSpecification::findOrFail($id);

        // Return single Categorys as a resource
        return new ProductWiseSpecificationResouerce($productWiseSpecification);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Categorys
        $productWiseSpecification = ProductWiseSpecification::findOrFail($id);

        if($productWiseSpecification->delete()) {
            return new ProductWiseSpecificationResouerce($productWiseSpecification);
        }    
    }

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getProductWiseSpecification($productId)
    {
        $productWiseSpecifications = ProductWiseSpecification::where('product_id', $productId)->get();

        // Return single Categorys as a resource
        return ProductWiseSpecificationResouerce::collection($productWiseSpecifications);
    }
}
