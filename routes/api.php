<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'auth'], function ($router) {
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});


Route::group(['middleware' => 'jwt.auth'], function ($router) {
    # 1.1 category routes
    // List category
    Route::get('categories', 'CategoryController@index');
    // List single category
    Route::get('category/{id}', 'CategoryController@show');
    // Create new category
    Route::post('category', 'CategoryController@store');
    // Update category
    Route::put('category', 'CategoryController@store');
    // Delete category
    Route::delete('category/{id}', 'CategoryController@destroy');

     # 1.1 sub-category routes
    // List sub-category
    Route::get('sub-categories', 'SubCategoryController@index');
    // List single sub-category
    Route::get('sub-category/{id}', 'SubCategoryController@show');
    // Create new sub-category
    Route::post('sub-category', 'SubCategoryController@store');
    // Update sub-category
    Route::put('sub-category', 'SubCategoryController@store');
    // Delete sub-category
    Route::delete('sub-category/{id}', 'SubCategoryController@destroy');
     // List single sub-category
    Route::get('sub-category/{id}/category', 'SubCategoryController@getByCategory');

    # 1.1 specification routes
    // List specification
    Route::get('specifications', 'SpecificationController@index');
    // List single specification
    Route::get('specification/{id}', 'SpecificationController@show');
    // Create new specification
    Route::post('specification', 'SpecificationController@store');
    // Update specification
    Route::put('specification', 'SpecificationController@store');
    // Delete specification
    Route::delete('specification/{id}', 'SpecificationController@destroy');

     # 1.1 specification routes
    // List specification
    Route::get('category-wise-specifications', 'CategoryWiseSpecificationController@index');
    // List single specification
    Route::get('category-wise-specification/{id}', 'CategoryWiseSpecificationController@show');
    // Create new specification
    Route::post('category-wise-specification', 'CategoryWiseSpecificationController@store');
    // Update specification
    Route::put('category-wise-specification', 'CategoryWiseSpecificationController@store');
    // Delete specification
    Route::delete('category-wise-specification/{id}', 'CategoryWiseSpecificationController@destroy');
    // List single specification
    Route::get('category-wise-specification-joint/{id}/category', 'CategoryWiseSpecificationController@getCategoryWiseSpecificationJoint');
    // List single specification
    Route::get('category-wise-specification/{id}/category', 'CategoryWiseSpecificationController@getCategoryWiseSpecification');

    # 1.1 specification routes
    // List specification
    Route::get('product-wise-specifications', 'ProductWiseSpecificationController@index');
    // List single specification
    Route::get('product-wise-specification/{id}', 'ProductWiseSpecificationController@show');
    // Create new specification
    Route::post('product-wise-specification', 'ProductWiseSpecificationController@store');
    // Update specification
    Route::put('product-wise-specification', 'ProductWiseSpecificationController@store');
    // Delete specification
    Route::delete('product-wise-specification/{id}', 'ProductWiseSpecificationController@destroy');
    // List single specification
    Route::get('product-wise-specification/{id}/product', 'ProductWiseSpecificationController@getProductWiseSpecification');


    # 1.1 brand routes
    // List brand
    Route::get('brands', 'BrandController@index');
    // List single brand
    Route::get('brand/{id}', 'BrandController@show');
    // Create new brand
    Route::post('brand', 'BrandController@store');
    // Update brand
    Route::put('brand', 'BrandController@store');
    // Delete brand
    Route::delete('brand/{id}', 'BrandController@destroy');
    // List brand
    Route::get('brands-datatable', 'BrandController@getDatatable');

     # 1.1 product routes
    // List product
    Route::get('products', 'ProductController@index');
    // List single product
    Route::get('product/{id}', 'ProductController@show');
    // Create new product
    Route::post('product', 'ProductController@store');
    // Update product
    Route::put('product', 'ProductController@store');
    // Delete product
    Route::delete('product/{id}', 'ProductController@destroy');
    // List group-information with parameters
    Route::post('price-list-file', 'PriceListController@storeUploadData');
    // Editor Image Upload
    Route::post('product/images/upload', 'ProductController@postImageUpload');
    // List brand
    Route::get('products-datatable', 'ProductController@getDatatable');

    Route::get('orders', 'OrderController@index');

    # 1.1 quote-request routes
    // List quote-request
    Route::get('quote-requests', 'QuoteRequestController@index');
    // List single quote-request
    Route::get('quote-request/{id}', 'QuoteRequestController@show');
    // Update quote-request
    Route::put('quote-request', 'QuoteRequestController@store');
    // Delete quote-request
    Route::delete('quote-request/{id}', 'QuoteRequestController@destroy');

     # 1.1 customer routes
    // List customer
    Route::get('customers', 'CustomerController@index');
    // List single customer
    Route::get('customer/{id}', 'CustomerController@show');
    // Create new customer
    Route::post('customer', 'CustomerController@store');
    // Update customer
    Route::put('customer', 'CustomerController@store');
    // Delete customer
    Route::delete('customer/{id}', 'CustomerController@destroy');


    # 1.1 brand routes
    // List brand
    Route::get('brands', 'BrandController@index');
    // List single brand
    Route::get('brand/{id}', 'BrandController@show');
    // Create new brand
    Route::post('brand', 'BrandController@store');
    // Update brand
    Route::put('brand', 'BrandController@store');
    // Delete brand
    Route::delete('brand/{id}', 'BrandController@destroy');
    // List brand
    Route::get('brands-datatable', 'BrandController@getDatatable');



    # 1.1 Stock routes
    // List stock
    Route::get('stocks', 'StockController@index');
    // List single stock
    Route::get('stock/{id}', 'StockController@show');
    // Create new stock
    Route::post('stock', 'StockController@store');
    // Update stock
    Route::put('stock', 'StockController@store');
    // Delete stock
    Route::delete('stock/{id}', 'StockController@destroy');
    // List stock
    Route::get('stocks-datatable', 'StockController@getDatatable');


    # 1.1 Seller routes
    // List seller
    Route::get('sellers', 'SellerController@index');
    // List single seller
    Route::get('seller/{id}', 'SellerController@show');
    // Create new seller
    Route::post('seller', 'SellerController@store');
    // Update seller
    Route::put('seller', 'SellerController@store');
    // Delete seller
    Route::delete('seller/{id}', 'SellerController@destroy');
    // List seller
    Route::get('sellers-datatable', 'SellerController@getDatatable');

    # 1.1 Purchase routes
    // List purchase
    Route::get('purchases', 'PurchaseController@index');
    // List single purchase
    Route::get('purchase/{id}', 'PurchaseController@show');
    // Create new purchase
    Route::post('purchase', 'PurchaseController@store');
    // Update purchase
    Route::put('purchase', 'PurchaseController@store');
    // Delete purchase
    Route::delete('purchase/{id}', 'PurchaseController@destroy');
    // List purchase
    Route::get('purchases-datatable', 'PurchaseController@getDatatable');
});

Route::post('register', 'AuthController@register');

// List category
Route::get('frontend-brands', 'BrandController@getBrandForCategoryFrontend');

// List category
Route::get('frontend-products', 'ProductController@getProductFrontend');

// List single product
Route::get('frontend-product/{id}', 'ProductController@show');
// List category
Route::get('frontend-brands', 'BrandController@getBrands');

// List category
Route::get('frontend-categories', 'CategoryController@getCategoriesFrontend');

// List single product
Route::get('frontend-brand/{id}', 'BrandController@show');

// List category
Route::get('frontend-category-wise-products/{id}', 'ProductController@getProductsByCategory');

// List category
Route::get('frontend-sub-category-wise-products/{id}', 'ProductController@getProductsBySubCategory');

// List category
Route::get('frontend-search-products/{term}', 'ProductController@getSearchedProductFrontend');

Route::post('customer-register', 'CustomerController@store');

Route::post('customer-login', 'CustomerController@login');

Route::post('place-order', 'OrderController@store');

// List single product
Route::get('frontend-order/{id}', 'OrderController@show');

Route::post('dealer-register', 'CustomerController@registerDealer');

Route::post('dealer-login', 'CustomerController@loginDealer');

// Create new quote-request
Route::post('quote-request', 'QuoteRequestController@store');

// Download attachments
Route::get('price-list/download', 'PriceListController@downloadPriceList');