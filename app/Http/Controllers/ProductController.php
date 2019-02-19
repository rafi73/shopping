<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductWiseSpecification;
use App\Http\Resources\ProductResource;
use App\Helpers\ImageProcessing;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Products
        $products = Product::orderBy('created_at', 'desc')->paginate(100);

        // Return collection of Products as a resource
        return ProductResource::collection($products);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = $request->isMethod('put') ? Product::findOrFail($request->id) : new Product;

        $product->name= $request->input('name');
        $product->category_id= $request->input('category_id');
        $product->sub_category_id= $request->input('sub_category_id');
        $product->brand_id= $request->input('brand_id');
        $product->description= $request->input('description');
        $product->image= $this->manageImages($request->input('image'), $product->image);
        $product->reference= $request->input('reference');
        $product->condition= $request->input('condition');
        $product->price= $request->input('price');
        $product->discount_price= $request->input('discount_price');
        $product->more_info= $request->input('more_info');
        $product->inside_box= $request->input('inside_box');
        $product->active= $request->input('active');
        $product->new= $request->input('new');
        $product->created_by= $request->input('created_by');
        $product->updated_by= $request->input('updated_by');

        if($product->save()) {
            ProductWiseSpecification::where('product_id', $product->id)->delete();
            $specifications = $request->input('specification');
            foreach ($specifications as $key => $value) 
            {
                $productWiseSpecification = new ProductWiseSpecification;
                $productWiseSpecification->product_id = $product->id;
                $productWiseSpecification->specification_id = $key;
                $productWiseSpecification->description = $value;
                $productWiseSpecification->created_by = $request->input('created_by');
                $productWiseSpecification->updated_by = $request->input('updated_by');
                $productWiseSpecification->save();
            }

            return new ProductResource($product);
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
        // Get Products
        $product = Product::findOrFail($id);

        $productWiseSpec = ProductWiseSpecification::with('specification')->where("product_id", $id)->get();

        return response()->json(['product' => $product, 'productWiseSpec' => $productWiseSpec]);
        // Return single Products as a resource
        //return new ProductResource($product);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Products
        $product = Product::findOrFail($id);

        if($product->delete()) 
        {
            return new ProductResource($product);
        }    
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getProductFrontend()
    {
        // Get Products
        $products = Product::orderBy('created_at', 'desc')->Where('active', 1)->paginate(10);

        // Return collection of Products as a resource
        return ProductResource::collection($products);
    }


     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getProductsByCategory($categoryId)
    {
        // Get Products
        $products = Product::orderBy('created_at', 'desc')->Where('category_id', $categoryId)->Where('active', 1)->paginate(20);

        // Return collection of Products as a resource
        return ProductResource::collection($products);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getProductsBySubCategory($subCategoryId)
    {
        // Get Products
        $products = Product::orderBy('created_at', 'desc')->Where('sub_category_id', $subCategoryId)->Where('active', 1)->paginate(20);

        // Return collection of Products as a resource
        return ProductResource::collection($products);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getSearchedProductFrontend($term)
    {
        // Get Products
        $products = Product::where('name', 'LIKE', "%$term%")->get();

        // Return collection of Products as a resource
        return ProductResource::collection($products);
    }

    public function postImageUpload(Request $request)
    {
        $path = public_path().'/uploads/';
        if (!file_exists($path)) 
        {
            mkdir($path, 0777, true);
        }

        $extension = $request->file('file')->getClientOriginalExtension();
        $fileName = str_random(8).'.'.$extension;
        $file = $request->file('file');
        $file->move($path, $fileName);
        return '/uploads/'.$fileName;
    }

    public function manageImages($images, $previousImages)
    {
        if(is_array($images))
        {
            $imagePaths = [];
            foreach ($images as $key => $value) 
            {
                array_push($imagePaths, ImageProcessing::saveBase64ImagePng($value['path']));
            }
            return implode(',', $imagePaths);
        }
        else
        {
            if($previousImages)
            {
                $deletedImages = array_diff(explode(",", $previousImages), explode(",", $images));
                foreach ($deletedImages as $key => $value)
                {
                    if (file_exists(public_path().$value))
                    {
                        unlink(public_path().$value);
                    } 
                }
            }
            return $images;
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
        // Get Products   
        $query = Product::where(function ($query) use($search) {
                            $query->where('name', 'like', '%' . $search . '%')
                            ->orWhere('description', 'like', '%' . $search . '%');
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        $products = $query->paginate($rowsPerPage);

        // Return collection of Brands as a resource
        return ProductResource::collection($products);
    }
}
