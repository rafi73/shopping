<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Http\Resources\CategoryResource;
use App\Attachment;
use App\Helpers\ImageProcessing;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Categorys
        $categories = Category::orderBy('created_at', 'desc')->paginate(100);

        // Return collection of Categorys as a resource
        return CategoryResource::collection($categories);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $category = $request->isMethod('put') ? Category::findOrFail($request->id) : new Category;

        $category->name= $request->input('name');
        $category->description= $request->input('description');
        $category->image = $request->input('image')? ImageProcessing::saveBase64ImagePng($request->input('image')) : NULL;
        $category->active= $request->input('active');
        if($category->save()) {
            return new CategoryResource($category);
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
        // Get Categorys
        $category = Category::findOrFail($id);

        // Return single Categorys as a resource
        return new CategoryResource($category);
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
        $category = Category::findOrFail($id);

        if($category->delete()) {
            return new CategoryResource($category);
        }    
    }

    /**
     * Display a listing of the resource with requested parameters.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getCategoryData(Request $request)
    {
         // Get Kawarabis
         $search = $request->input('search');
         $kawarabis = Category::Where('subject', 'like', '%' . $search . '%')->orderBy('created_at', 'desc')->paginate(10);
 
         // Return collection of Kawarabis as a resource
         return CategoryResource::collection($kawarabis);
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function getCategoriesFrontend()
     {
        // Get Categorys
        $categories = Category::with('subCategories')->orderBy('created_at', 'desc')->Where('active', 1)->get();

         // Return collection of Categorys as a resource
         //return CategoryResource::collection($categories);
         return response()->json(['data' => $categories]);
     }


     /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getCategoryFrontend($id)
    {
        // Get Categorys
        $category = Category::findOrFail($id);

        // Return single Categorys as a resource
        return new CategoryResource($category);
    }

}
