<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




Route::get('/admin/{any}', function () {
    return view('admin');
})->where('any', '.*');

Route::view('/', 'home')->name('home');

Route::view('/brand/{id}', 'brand')->name('brand');

Route::view('/product/{id}', 'product')->name('product');

Route::view('/cart', 'cart')->name('cart');

Route::view('/checkout', 'checkout')->name('checkout');

Route::view('/about-us', 'about')->name('about');

Route::view('/contact', 'contact')->name('contact');

Route::view('/category/{id}', 'category')->name('category');

Route::view('/sub-category/{id}', 'subCategory')->name('sub-category');

Route::view('/search/{term}', 'search')->name('search');

Route::view('/authentication', 'authentication')->name('authentication');

Route::view('/invoice/{id}', 'invoice')->name('invoice');

Route::view('/dealer', 'dealer')->name('dealer');

Route::view('/quotation', 'quotation')->name('quotation');

Route::view('/pricelist', 'pricelist')->name('pricelist');