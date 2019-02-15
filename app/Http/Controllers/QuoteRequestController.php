<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\QuoteRequest;
use App\Http\Resources\QuoteRequestResource;

class QuoteRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get QuoteRequests
        $quoteRequests = QuoteRequest::orderBy('created_at', 'desc')->paginate(100);

        // Return collection of QuoteRequests as a resource
        return QuoteRequestResource::collection($quoteRequests);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $quoteRequest = new QuoteRequest;

        $quoteRequest->name= $request->input('name');
        $quoteRequest->email= strtolower($request->input('email'));
        $quoteRequest->company_name= $request->input('company_name');
        $quoteRequest->company_reg_number= $request->input('company_reg_number');
        $quoteRequest->company_address= $request->input('company_address');
        $quoteRequest->contact= $request->input('contact');
        $quoteRequest->additional_message= $request->input('additional_message');
        $quoteRequest->created_by= 0;
        $quoteRequest->updated_by= 0;
        $quoteRequest->save();

        return new QuoteRequestResource($quoteRequest);
    }


    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Get QuoteRequests
        $quoteRequest = QuoteRequest::findOrFail($id);

        // Return single QuoteRequests as a resource
        return new QuoteRequestResource($quoteRequest);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get QuoteRequests
        $quoteRequest = QuoteRequest::findOrFail($id);

        if($quoteRequest->delete()) {
            return new QuoteRequestResource($quoteRequest);
        }    
    }

    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        $quoteRequest = QuoteRequest::where('email', $email)->first();

        if(!$quoteRequest)
            return $quoteRequest;
        
        // Check if sale password is correct
        if (Hash::check($password, $quoteRequest->password)) 
        {
            return new QuoteRequestResource($quoteRequest);
        } 
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function registerDealer(Request $request)
    {
        $quoteRequest = new QuoteRequest;

        $quoteRequest->name= $request->input('name');
        $quoteRequest->email= strtolower($request->input('email'));
        $quoteRequest->password= bcrypt($request->input('password'));
        $quoteRequest->is_dealer = true;
        $quoteRequest->save();

        return new QuoteRequestResource($quoteRequest);
    }

    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function loginDealer(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        $quoteRequest = QuoteRequest::where('email', $email)->first();

        if(!$quoteRequest || $quoteRequest->is_dealer == 1)
            return $quoteRequest;
        
        // Check if sale password is correct
        if (Hash::check($password, $quoteRequest->password)) 
        {
            return new QuoteRequestResource($quoteRequest);
        } 
        
    }
}
