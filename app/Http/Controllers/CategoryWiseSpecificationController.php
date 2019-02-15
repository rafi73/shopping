<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CategoryWiseSpecification;
use App\Specification;
use App\Http\Resources\CategoryWiseSpecificationResouerce;
use DB;

class CategoryWiseSpecificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Categorys
        $categories = CategoryWiseSpecification::orderBy('created_at', 'desc')->Where('active', 1)->paginate(100);

        // Return collection of Categorys as a resource
        return CategoryWiseSpecificationResouerce::collection($categories);
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
            CategoryWiseSpecification::where('category_id',$data[0]['category_id'])->delete();
        }
        CategoryWiseSpecification::insert($request->input('data'));
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
        $categoryWiseResource = CategoryWiseSpecification::findOrFail($id);

        // Return single Categorys as a resource
        return new CategoryWiseSpecificationResouerce($categoryWiseResource);
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
        $categoryWiseResource = CategoryWiseSpecification::findOrFail($id);

        if($categoryWiseResource->delete()) {
            return new CategoryWiseSpecificationResouerce($categoryWiseResource);
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
         $kawarabis = CategoryWiseSpecification::Where('subject', 'like', '%' . $search . '%')->orderBy('created_at', 'desc')->paginate(10);
 
         // Return collection of Kawarabis as a resource
         return CategoryWiseSpecificationResouerce::collection($kawarabis);
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function getCategoryDataFront()
     {
        // Get Categorys
        $categories = CategoryWiseSpecification::orderBy('updated_at', 'desc')->Where('deactivate', 0)->take(4)->get();

        foreach($categories as $categoryWiseResource)
        {
            $files = explode(",", $categoryWiseResource['file']);
            $categoryWiseResource['attachments'] =  Attachment::WhereIn('id', $files)->get();
        }
 
         // Return collection of Categorys as a resource
         return CategoryWiseSpecificationResouerce::collection($categories);
     }

     /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getCategoryWiseSpecificationJoint($categoryId)
    {
        // Get Categorys
        // $categoryWiseResource = //Specification::leftJoin('category_wise_specifications', 'specifications.id', '=', 'category_wise_specifications.specification_id')
        //                                         //->where('category_wise_specifications.category_id', $categoryId)
        //                                         //->get();

        //                                         Specification::select('*', DB::raw('specifications.id AS id, specifications.name, category_wise_specifications.category_id'))
        //                                             ->leftJoin('category_wise_specifications', function($join) {
        //                                             $join->on('specifications.id', '=', 'category_wise_specifications.specification_id');
        //                                           })
        //                                           ->whereNull('category_wise_specifications.specification_id')
        //                                           ->where('category_wise_specifications.category_id', $categoryId)
        //                                           ->get();
        //                                           //->whereNull('category_wise_specifications.specification_id');


        $specifications = Specification::where('active', 1)->get()->toArray();
        $categoryWiseSpecifications = CategoryWiseSpecification::where('category_id', $categoryId)->get()->toArray();

        foreach ($specifications as $key => $value) 
        {
            $specifications[$key]['checked'] = (string)array_search($value['id'], array_column($categoryWiseSpecifications, 'specification_id'));
        }

        //dd($specifications);

        // Return single Categorys as a resource
        return response()->json(['data' => $specifications]);
    }

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getCategoryWiseSpecification($categoryId)
    {
        $categoryWiseSpecifications = CategoryWiseSpecification::where('category_id', $categoryId)->get();

        // Return single Categorys as a resource
        return CategoryWiseSpecificationResouerce::collection($categoryWiseSpecifications);
    }
}
