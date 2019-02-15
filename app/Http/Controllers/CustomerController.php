<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Http\Resources\CustomerResource;
use Hash;

class CustomerController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
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
        $query = Customer::where(function ($query) use($search) {
                            $query->where('name', 'like', '%' . $search . '%')
                            ->orWhere('email', 'like', '%' . $search . '%');
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        
        $customers = $query->paginate($rowsPerPage);

        // Return collection of Customers as a resource
        return CustomerResource::collection($customers);
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $customer = $request->isMethod('put') ? Customer::findOrFail($request->id) : new Customer;

        $customer->name= $request->input('name');
        $customer->email= strtolower($request->input('email'));

        if($request->input('password') != null)
        {
            $customer->password= bcrypt($request->input('password'));
        }
        
        $customer->phone= $request->input('phone');
        $customer->company= $request->input('company');
        $customer->country= $request->input('country');
        $customer->state= $request->input('state');
        $customer->address= $request->input('address');
        $customer->is_dealer = $request->input('is_dealer');
        $customer->active = $request->input('active');
        $customer->save();

        return new CustomerResource($customer);
    }


    /**
     * Display the specified resource.
     *$
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Get Customers
        $customer = Customer::findOrFail($id);

        // Return single Customers as a resource
        return new CustomerResource($customer);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Customers
        $customer = Customer::findOrFail($id);

        if($customer->delete()) {
            return new CustomerResource($customer);
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

        $customer = Customer::where('email', $email)->first();

        if(!$customer)
        {
            return $customer;
        }
        else if (Hash::check($password, $customer->password)) 
        {
            return new CustomerResource($customer);
        } 
        
        return null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function registerDealer(Request $request)
    {
        $customer = new Customer;

        $customer->name= $request->input('name');
        $customer->email= strtolower($request->input('email'));
        $customer->password= bcrypt($request->input('password'));
        $customer->is_dealer = true;
        $customer->save();

        return new CustomerResource($customer);
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

        $customer = Customer::where('email', $email)->first();

        if(!$customer || $customer->is_dealer != 1)
        {
            return null;
        }
        else if (Hash::check($password, $customer->password)) 
        {
            return new CustomerResource($customer);
        } 
        
        return null;
    }
}
