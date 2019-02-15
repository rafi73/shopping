<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SubCategory;
use App\Http\Resources\SubCategoryResource;
use App\Attachment;
use App\Helpers\ImageProcessing;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Categorys
        $subCategories = SubCategory::orderBy('created_at', 'desc')->paginate(100);

        // Return collection of Categorys as a resource
        return SubCategoryResource::collection($subCategories);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $subCategory = $request->isMethod('put') ? SubCategory::findOrFail($request->id) : new SubCategory;

        $subCategory->name= $request->input('name');
        $subCategory->category_id= $request->input('category_id');
        $subCategory->description= $request->input('description');
        $subCategory->image = $request->input('image')? ImageProcessing::saveBase64ImagePng($request->input('image')) : NULL;
        $subCategory->active= $request->input('active');
        if($subCategory->save()) {
            return new SubCategoryResource($subCategory);
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
        $subCategory = SubCategory::findOrFail($id);

        // Return single Categorys as a resource
        return new SubCategoryResource($subCategory);
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
        $subCategory = SubCategory::findOrFail($id);

        if($subCategory->delete()) {
            return new SubCategoryResource($subCategory);
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
         $kawarabis = SubCategory::Where('subject', 'like', '%' . $search . '%')->orderBy('created_at', 'desc')->paginate(10);
 
         // Return collection of Kawarabis as a resource
         return SubCategoryResource::collection($kawarabis);
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function getCategoryDataFront()
     {
        // Get Categorys
        $subCategories = SubCategory::orderBy('updated_at', 'desc')->Where('deactivate', 0)->take(4)->get();

        foreach($subCategories as $subCategory)
        {
            $files = explode(",", $subCategory['file']);
            $subCategory['attachments'] =  Attachment::WhereIn('id', $files)->get();
        }
 
         // Return collection of Categorys as a resource
         return SubCategoryResource::collection($subCategories);
     }

     /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getByCategory($categoryId)
    {
        // Get Categorys
        $subCategories = SubCategory::where('category_id', $categoryId)->get();

        // Return single Categorys as a resource
        return SubCategoryResource::collection($subCategories);
    }
}
