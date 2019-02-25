<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Stock;
use App\Http\Resources\StockResource;
use DB;
use Exception;
use App\Purchase;


class StockController extends Controller
{
   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get Stocks
        $stocks = Stock::orderBy('created_at', 'desc')->paginate(10);

        // Return collection of Stocks as a resource
        return StockResource::collection($stocks);
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $stock = $request->isMethod('put') ? Stock::findOrFail($request->id) : new Stock;

        $stock->product_id= $request->input('product_id');
        $stock->quantity= $request->input('quantity');
        $stock->batch= $request->input('batch');
        $stock->seller_id= $request->input('seller_id');
        $stock->expiry_date= $request->input('expiry_date');
        $stock->cost_price= $request->input('cost_price');
        $stock->active= $request->input('active');
        $stock->created_by= $request->input('created_by');
        $stock->updated_by= $request->input('updated_by');
        if($stock->save()) 
        {
            return new StockResource($stock);
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
        // Get Stocks
        $stock = Stock::findOrFail($id);

        // Return single Stocks as a resource
        return new StockResource($stock);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get Stocks
        $stock = Stock::findOrFail($id);

        if($stock->delete()) 
        {
            return new StockResource($stock);
        }    
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getStockForCategoryFrontend()
    {
        // Get Stocks
        $stocks = Stock::orderBy('created_at', 'desc')->Where('active', 1)->paginate(10);

        // Return collection of Stocks as a resource
        return StockResource::collection($stocks);
    } 

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getStockWithProducts()
    {
        // Get Stocks
        $stocks = Stock::with('products')->orderBy('created_at', 'desc')->Where('active', 1)->get();

        //dd($stocks);

        // Return collection of Stocks as a resource
        //return StockResource::collection($stocks);
        return view('home', compact('Stocks'));
    } 

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getStocks()
    {
        // Get Stocks
        $stocks = Stock::with('products')->orderBy('created_at', 'desc')->Where('active', 1)->get();

        // Return collection of Stocks as a resource
        return StockResource::collection($stocks);
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
        // Get Stocks   
        $query = Stock::where(function ($query) use($search) {
                            $query->where('batch', 'like', '%' . $search . '%')
                            ->orWhereHas('product', function ($query) use ($search){
                                $query->where('name', 'like', '%' . $search . '%');
                            })
                            ->orWhereHas('seller', function ($query) use ($search){
                                $query->where('name', 'like', '%' . $search . '%');
                            });
                        });

        if (isset($sortType)) 
        {
            $query = $query->orderBy($sortBy, $sortType);
        }
        $stocks = $query->paginate($rowsPerPage);

        // Return collection of Stocks as a resource
        return StockResource::collection($stocks);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addStockFromPurchase(Request $request)
    {
        $stock = new Stock;
        DB::beginTransaction();
        try
        {
            $purchase = Purchase::findOrFail($request->input('purchase_id'));
            $purchase->added_to_stock = true;
            $purchase->save();

            $stock->product_id= $request->input('product_id');
            $stock->quantity= $request->input('quantity');
            $stock->batch= $request->input('batch');
            $stock->seller_id= $request->input('seller_id');
            $stock->cost_price= $request->input('cost_price');
            $stock->expiry_date= $request->input('expiry_date');
            $stock->active= $request->input('active');
            $stock->created_by= $request->input('created_by');
            $stock->updated_by= $request->input('updated_by');
            $stock->save();

            DB::commit();
        }
        catch(Exception $exception)
        {
            DB::rollback();
            return response()->json(['error' => $exception->getMessage()], 500);
        }
        return new StockResource($stock);
    }
}
