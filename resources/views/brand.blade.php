@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Brand'])

<!-- products area start -->
<div class="pt-40">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-8 col-sm-offset-2 col-md-offset-0">
                <!-- sidebar start -->
                <div class="sidebar">
                    <!-- categories start -->
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">categories</h3>
                        <div v-bind:key="category.id" v-for="brand in brands" class="input-box">
                            <input type="checkbox" name="category" value="dresses" id="dresses">
                            <label for="dresses">@{{category.name}}</label>
                        </div>
                        {{-- <div class="input-box">
                            <input type="checkbox" name="category" value="handbags" id="handbags">
                            <label for="handbags">handbags (9)</label>
                        </div>
                        <div class="input-box">
                            <input type="checkbox" name="category" value="shoes" id="shoes">
                            <label for="shoes">shoes (9)</label>
                        </div>
                        <div class="input-box">
                            <input type="checkbox" name="category" value="clothing" id="clothing">
                            <label for="clothing">clothing (9)</label>
                        </div> --}}
                    </div>
                    <!-- categories end -->

                    <!-- Availability start -->
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">Availability</h3>
                        <div class="input-box">
                            <input type="checkbox" name="instock" value="instock" id="stock">
                            <label for="stock">in stock (9)</label>
                        </div>
                    </div>
                    <!-- Availability end -->

                    <!-- conditions start -->
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">conditions</h3>
                        <div class="input-box">
                            <input type="checkbox" name="new" value="new" id="new">
                            <label for="new"> new (9)</label>
                        </div>
                    </div>
                    <!-- conditions end -->

                    <!-- Manufacturer start -->
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">Brand</h3>
                        <div v-bind:key="brand.id" v-for="brand in brands" class="input-box">
                            <input type="checkbox" name="FashionManufacturer" value="FashionManufacturer" id="manufac">
                            <label for="manufac">@{{brand.name}}</label>
                        </div>
                    </div>
                    <!-- Manufacturer end -->

                    <!-- Price start -->
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">Price</h3>
                        <div class="price-slider-amount">
                            Range: <input type="text" id="amount" name="price" placeholder="Add Your Price" />
                        </div>
                        <div id="slider-range"></div>
                    </div>
                    <!-- Price end -->


                </div>
                <!-- sidebar end -->

                <!-- top seller items start -->
                <div class="row">
                    <div class="col-md-12 mt-40">
                        <!-- section title start -->
                        <div class="section-heading">
                            <h2> <img src="{{asset('themes/frontend/img/icon/icon_title_topseller.png')}}" alt="">
                                top
                                seller</h2>
                        </div>
                        <!-- section title start -->
                        <!-- new arrival start -->
                        <div class="new-arrival-items style-2 grey-bordered mt-30">

                            <!-- list items start -->
                            <div class="list-items">

                                <!-- single product item start -->
                                <div v-bind:key="product.id" v-for="product in products" class="single-product-item floating">
                                    <a href="product-details.html" class="item-img">
                                        <img :src="product.image || '/img/logo.png'" />
                                    </a>
                                    <div class="item-info">
                                        <h2><a href="product-details.html" class="item-title">@{{product.name}}</a></h2>
                                        {{-- <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div> --}}
                                        <h3 class="item-price"> @{{product.price}}</h3>
                                    </div>
                                </div>
                                <!-- single product item end -->
                                <!-- single product item end -->

                            </div>
                            <!-- list items start -->

                            <!-- list items start -->
                            <div class="list-items">
                                <!-- single product item start -->
                                <div class="single-product-item floating">
                                    <a href="product-details.html" class="item-img">
                                        <img src="{{asset('themes/frontend/img/products/42.jpg')}}" alt="">
                                    </a>
                                    <div class="item-info">
                                        <h2><a href="product-details.html" class="item-title">10FT Paracord 7
                                                Strand
                                                Parachute Cord...</a></h2>
                                        {{-- <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div> --}}
                                        <h3 class="item-price"> $50.78 </h3>
                                    </div>
                                </div>
                                <!-- single product item end -->
                                <!-- single product item start -->
                                <div class="single-product-item floating">
                                    <a href="product-details.html" class="item-img">
                                        <img src="{{asset('themes/frontend/img/products/48.jpg')}}" alt="">
                                    </a>
                                    <div class="item-info">
                                        <h2><a href="product-details.html" class="item-title">Butterfly Mid-Century
                                                Dining Chair...</a></h2>
                                        <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h3 class="item-price"> $20.71 </h3>
                                    </div>
                                </div>
                                <!-- single product item end -->
                                <!-- single product item start -->
                                <div class="single-product-item floating">
                                    <a href="product-details.html" class="item-img">
                                        <img src="{{asset('themes/frontend/img/products/37.jpg')}}" alt="">
                                    </a>
                                    <div class="item-info">
                                        <h2><a href="product-details.html" class="item-title">Customized 19Inch
                                                Computer Screen...</a></h2>
                                        <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h3 class="item-price"> $30.98 </h3>
                                    </div>
                                </div>
                                <!-- single product item end -->
                                <!-- single product item start -->
                                <div class="single-product-item floating">
                                    <a href="product-details.html" class="item-img">
                                        <img src="{{asset('themes/frontend/img/products/21.jpg')}}" alt="">
                                    </a>
                                    <div class="item-info">
                                        <h2><a href="product-details.html" class="item-title">Customized 19Inch
                                                Computer Screen...</a></h2>
                                        <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h3 class="item-price"> $30.98 </h3>
                                    </div>
                                </div>
                                <!-- single product item end -->
                            </div>
                            <!-- list items start -->

                        </div>
                        <!-- new arrival end -->
                    </div>
                </div>
                <!-- top seller items end -->
            </div>
            <div class="col-md-9 col-sm-12 sm-mt-30 xs-mt-30">
                <!-- category images start -->
                <div class="category-img">
                    <img src="{{asset('img/27.jpg')}}" alt="">
                </div>
                <!-- category images end -->

                <!-- category options start -->
                <div class="category-options mt-40">
                    <div class="category-title">
                        <h2>Brand <span class="text-right">there are @{{products.length}} products</span></h2>
                    </div>
                    <div class="category-bar">
                        <!-- tab menu start -->
                        <ul class="list-gird-tab-menu">
                            <li class="active"><a data-toggle="tab" href="#gird-items"> <i class="fa fa-th"></i>
                                </a></li>
                            <li><a data-toggle="tab" href="#list-items"> <i class="fa fa-list-ul"></i> </a></li>
                        </ul>
                        <!-- tab menu end -->
                        <!-- sort type start -->
                        <div class="size">
                            <form action="#">
                                sort by:
                                <select name="size" id="size">
                                    <option value="1">Price: Lowest first</option>
                                    <option value="2">Price: Highest first</option>
                                    <option value="3">Product Name: A to Z</option>
                                    <option value="4">Product Name: Z to A</option>
                                    <option value="5">In stock</option>
                                    <option value="6">Reference: Lowest first</option>
                                    <option value="7">Reference: Highest first</option>
                                </select>
                            </form>
                        </div>
                        <!-- sort type end -->
                        <a href="#" class="compare-btn">compare (0) <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
                <!-- category options end -->

                <!-- category items start -->
                <div class="category-items">
                    <div class="tab-content mt-30">
                        <div class="tab-pane active fade in" id="gird-items">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="gird-items">
                                        <!-- single product item start -->
                                        <div v-bind:key="product.id" v-for="product in brand.products" class="single-product-item">
                                            <a href="#" @click.prevent="goToProduct(product)" class="item-img">
                                                <img :src="product.image || '/img/logo.png'" />

                                                <span class="sale"></span>
                                            </a>
                                            <div class="item-info text-center">
                                                <h2><a href="product-details.html" class="item-title">@{{product.name}}</a></h2>
                                                {{-- <div class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div> --}}
                                                <h3 class="item-price"> @{{product.price}} 
                                                    {{-- <span class="old-price">$30.51</span> --}}
                                                </h3>
                                                <div class="actions">
                                                    <a href="#" @click.prevent="addToCart(product)" class="single-action" data-toggle="modal" data-target="#confirm-modal">add to cart</a>
                                                </div>
                                                <div class="hover-content">
                                                    {{-- <a href="#" class="single-action"> <i class="zmdi zmdi-favorite-outline"></i>
                                                    </a>
                                                    <a href="#" class="single-action"> <i class="zmdi zmdi-refresh-alt"></i>
                                                    </a> --}}
                                                    <a href="#" @click.prevent="singleProductModal(product)" class="single-action" data-toggle="modal" data-target="#item-modal">
                                                        <i class="zmdi zmdi-search"></i> 
                                                    </a>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single product item end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="list-items">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="list-category-items">
                                        <!-- single product item start -->
                                        <div v-bind:key="product.id" v-for="product in brand.products" class="single-product-item floating">
                                            <a href="#" @click.prevent="goToProduct(product)" class="item-img">
                                                <img :src="product.image || '/img/logo.png'" />
                                                <span class="sale"></span>
                                            </a>
                                            <div class="item-info">
                                                <h2><a href="product-details.html" class="item-title large">@{{product.name}}</a></h2>
                                                {{-- <div class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div> --}}
                                                <h3 class="item-price">@{{product.price}}
                                                    {{-- <span class="old-price">$30.51</span> --}}
                                                </h3>
                                                <p class="product-descriptions"> @{{product.description}}</p>
                                                <div class="actions">
                                                    {{-- <a href="#" @click.prevent="addToCart(product)" class="single-action">add
                                                        to cart</a>
                                                    <a href="#" class="single-action"> <i class="zmdi zmdi-favorite-outline"></i>
                                                    </a>
                                                    <a href="#" class="single-action"> <i class="zmdi zmdi-refresh-alt"></i>
                                                    </a> --}}
                                                    {{-- <a href="#" @click.prevent="singleProductModal(product)" class="single-action" data-toggle="modal" data-target="#item-modal">
                                                        <i class="zmdi zmdi-search"></i> 
                                                    </a> --}}
                                                </div>
                                                <div class="stock">
                                                    <p><span>In stock</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single product item end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- category items end -->
                <div class="category-options mt-40">
                    <div class="category-bar">
                        <p>Showing 1 - 9 of 9 items</p> <a href="#" class="compare-btn">compare (0) <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- products area end -->

@endsection