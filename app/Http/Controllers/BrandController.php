<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Brand;
use App\Http\Resources\BrandResource;
use App\Helpers\ImageProcessing;
class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Brands
        $brands = Brand::orderBy('created_at', 'desc')->paginate(10);

        // Return collection of Brands as a resource
        return BrandResource::collection($brands);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $brand = $request->isMethod('put') ? Brand::findOrFail($request->id) : new Brand;

        $brand->name= $request->input('name');
        $brand->description= $request->input('description');
        $brand->logo= $request->input('logo')? ImageProcessing::saveBase64ImagePng($request->input('logo')) : NULL;
        $brand->banner= $request->input('banner')? ImageProcessing::saveBase64ImagePng($request->input('banner')) : NULL;
        $brand->active= $request->input('active');
        $brand->created_by= $request->input('created_by');
        $brand->updated_by= $request->input('updated_by');
        if($brand->save()) {
            return new BrandResource($brand);
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
        // Get Brands
        $brand = Brand::findOrFail($id);

        // Return single Brands as a resource
        return new BrandResource($brand);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Brands
        $brand = Brand::findOrFail($id);

        if($brand->delete()) {
            return new BrandResource($brand);
        }    
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getBrandForCategoryFrontend()
    {
        // Get Brands
        $brands = Brand::orderBy('created_at', 'desc')->Where('active', 1)->paginate(10);

        // Return collection of Brands as a resource
        return BrandResource::collection($brands);
    } 

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getBrandWithProducts()
    {
        // Get Brands
        $brands = Brand::with('products')->orderBy('created_at', 'desc')->Where('active', 1)->get();

        //dd($brands);

        // Return collection of Brands as a resource
        //return BrandResource::collection($brands);
        return view('home', compact('brands'));
    } 

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getBrands()
    {
        // Get Brands
        $brands = Brand::with('products')->orderBy('created_at', 'desc')->Where('active', 1)->get();

        // Return collection of Brands as a resource
        return BrandResource::collection($brands);
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
        // Get Brands   
        $query = Brand::where(function ($query) use($search) {
                            $query->where('name', 'like', '%' . $search . '%')
                            ->orWhere('description', 'like', '%' . $search . '%');
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        $brands = $query->paginate($rowsPerPage);

        // Return collection of Brands as a resource
        return BrandResource::collection($brands);
    }
}
