<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\SpecificationResource;
use App\Specification;

class SpecificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Specifications
        $specifications = Specification::orderBy('created_at', 'desc')->paginate(100);

        // Return collection of Specifications as a resource
        return SpecificationResource::collection($specifications);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $Specification = $request->isMethod('put') ? Specification::findOrFail($request->id) : new Specification;

        $Specification->name= $request->input('name');
        $Specification->description= $request->input('description');
        $Specification->active= $request->input('active');
        $Specification->created_by= $request->input('created_by');
        $Specification->updated_by= $request->input('updated_by');
        if($Specification->save()) {
            return new SpecificationResource($Specification);
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
        // Get Specifications
        $Specification = Specification::findOrFail($id);

        // Return single Specifications as a resource
        return new SpecificationResource($Specification);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Specifications
        $Specification = Specification::findOrFail($id);

        if($Specification->delete()) {
            return new SpecificationResource($Specification);
        }    
    }

    /**
     * Display a listing of the resource with requested parameters.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getSpecificationData(Request $request)
    {
         // Get Kawarabis
         $search = $request->input('search');
         $kawarabis = Specification::Where('subject', 'like', '%' . $search . '%')->orderBy('created_at', 'desc')->paginate(10);
 
         // Return collection of Kawarabis as a resource
         return SpecificationResource::collection($kawarabis);
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function getSpecificationDataFront()
     {
        // Get Specifications
        $specifications = Specification::orderBy('updated_at', 'desc')->Where('deactivate', 0)->take(4)->get();

        foreach($specifications as $Specification)
        {
            $files = explode(",", $Specification['file']);
            $Specification['attachments'] =  Attachment::WhereIn('id', $files)->get();
        }
 
         // Return collection of Specifications as a resource
         return SpecificationResource::collection($specifications);
     }
}
