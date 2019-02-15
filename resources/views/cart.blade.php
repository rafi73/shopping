@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Cart'])

    <!-- cart area start -->
    <div class="cart-area mt-40">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <!-- cart table start -->
                    <div class="table-responsive">
                        <table class="table-bordered table">
                            <thead>
                                <tr>
                                    <!-- product img title -->
                                    <th class="item-img">Product</th>
                                    <!-- product name title -->
                                    <th class="product-name">description</th>
                                    <!-- stock status -->
                                    <th class="stock text-center">Availability</th>
                                    <!-- unit price title -->
                                    <th class="unit-price text-right"> unit Price</th>
                                    <!-- quantity -->
                                    <th class="quantity text-center">Quantity</th>
                                    <!-- remove button -->
                                    <th class="remove-icon text-center"></th>
                                    <!-- unit price title -->
                                    <th class="total-price text-right"> total Price</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <tr v-bind:key="product.id" v-for="product in cartProducts">
                                    <!-- product img end -->
                                    <td class="item-img">
                                        <a href="#" @click.prevent="goToProduct(product)">
                                            <img :src="getFirstImage(product.image) || '/img/logo.png'" />
                                        </a>
                                    </td>
                                    <!-- product img end -->
                                    <!-- product name start -->
                                    <td class="cart-product-name text-left">
                                    <a href="single-product.html">@{{product.name}}</a>
                                        <p>Reference : @{{product.name}}</p>
                                    </td>
                                    <!-- product name end -->
                                    <!-- stock status start -->
                                    <td class="stock">
                                        <span>in stock</span>
                                    </td>
                                    <!-- stock status end -->
                                    <!-- price start -->
                                    <td class="unit-price text-right">
                                        <span>RM@{{getPrice(product.price - product.discount_price)}}</span>
                                    </td>
                                    <!-- price end -->
                                    <!-- quantity start -->
                                    <td class="quantity">
                                    <input class="" type="text" v-on:keypress="isNumber($event)" name="qtybutton" v-model="product.quantity">
                                    </td>
                                    <!-- quantity end -->
                                    <!-- remove icon start -->
                                    <td class="remove-icon">
                                        <button @click.precent="removeProduct(product)"> <i class="fa fa-trash"></i> </button>
                                    </td>
                                    <!-- remove icon end -->
                                    <!-- price start -->
                                    <td class="unit-price text-right">
                                    <span>RM@{{ getPrice((product.price - product.discount_price) * product.quantity)}}</span>
                                    </td>
                                    <!-- price end -->
                                </tr>
                            </tbody>
                            <tfoot class="text-right">
                                <tr>
                                    <td colspan="3" rowspan="3"></td>
                                    <td colspan="3"> <strong> Total products</strong></td>
                                    <td colspan="1">RM@{{totalPrice}}</td>
                                </tr>
                                <tr>
                                    <td colspan="3"><strong>Total shipping</strong></td>
                                    <td colspan="1">RM0.00</td>
                                </tr>
                                <tr>
                                    <td colspan="3"><strong>Total</strong></td>
                                    <td colspan="1">RM@{{totalPrice}}</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- cart table end -->
                    <div class="buttons mt-20">
                        <a href="{{ url()->previous() }}" class="stock"> <span><i class="fa fa-angle-left"></i> continue shopping</span></a>
                        <a href="#" @click.prevent="goToCheckout()" class="stock"> <span> proceed to checkout <i class="fa fa-angle-right"></i></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection