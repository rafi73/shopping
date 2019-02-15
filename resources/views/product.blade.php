@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Product'])

<!-- product details start -->
<div class="mt-40">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-modal">
                    <!-- single product item start -->
                    <div class="single-product-item floating">
                        <a href="#" class="item-img">
                            <img :src="getFirstImage(product.image) || '/img/logo.png'" />
                            {{-- <span class="sale"></span> --}}
                        </a>
                    {{-- <div class="item-img">
                        <img src="#"  class="img-rounded">
                        <img src="#"  class="img-circle">
                        <img src="#" class="img-thumbnail">
                    </div> --}}
                        <div class="item-info">
                            <h2><span class="item-title large">@{{product.name}}</span></h2>
                            <div class="info">
                                <p>Reference: <span>@{{product.reference}}</span></p>
                                <p>Condition: <span>@{{product.condition}}</span></p>
                            </div>

                            <h3 class="old-price" v-show="product.discount_price > 0">
                                <span class="old-price-span">
                                    RM@{{getPrice(product.price)}} 
                                </span>
                                <span class="item-price item-price-discount">
                                    &nbsp; -RM@{{getPrice(product.discount_price)}}
                                </span>
                            </h3>
                            <h2 class="item-price">
                                RM@{{getPrice(product.price - product.discount_price)}}
                            </h2>
                            <p class="product-descriptions" v-html="product.description"></p>
                            <div>
                                <label>Quantity: </label>
                                <input class="cart-plus-minus-box" v-model="product.quantity" type="text" name="a">
                                <div @click.prevent="product.quantity++" class="qtybutton">-</div>
                                <div @click.prevent="product.quantity--" class="qtybutton">+</div>
                            </div>
                            <br />
                            <div class="actions">
                                <a href="#" @click.prevent="addToCart(product)" class="single-action" data-toggle="modal"
                                    data-target="#confirm-modal">add to cart</a>
                                {{-- <a href="#" class="single-action"> <i class="fa fa-envelope"></i> </a>
                                <a href="#" class="single-action"> <i class="fa fa-print"></i> </a>
                                <a href="#" class="single-action"> <i class="zmdi zmdi-favorite-outline"></i> </a> --}}
                            </div>
                            <div class="stock">
                                {{-- <p> 300 Items <span>In stock</span></p> --}}
                            </div>
                            <div class="social-share">
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i> twitter</a>
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i> share</a>
                                <a href="#" target="_blank"><i class="fa fa-google-plus"></i> Google+</a>
                                <a href="#" target="_blank"><i class="fa fa-pinterest"></i> pinterest</a>
                            </div>
                        </div>
                    </div>
                    <!-- single product item end -->
                </div>
            </div>
        </div>
        

        {{-- <div class="col-md-6">
            <h3>Pills left</h3>
            <!-- tabs left -->
            <div class="tabbable">
                <ul class="nav nav-pills nav-stacked col-md-3">
                    <li><a href="#a" data-toggle="tab">One</a></li>
                    <li class="active"><a href="#b" data-toggle="tab">Two</a></li>
                    <li><a href="#c" data-toggle="tab">Twee</a></li>
                </ul>
                <div class="tab-content col-md-9">
                    <div class="tab-pane active" id="a">Lorem ipsum dolor sit amet, charetra varius rci quis tortor
                        imperdiet venenatis quam sit amet vulputate. Quisque mauris augue, molestie tincidunt
                        condimentum vitae, gravida a libero.</div>
                    <div class="tab-pane" id="b">Secondo sed ac orci quis tortor imperdiet venenatis. Duis elementum
                        auctor accumsan. Aliquam in felis sit amet augue.</div>
                    <div class="tab-pane" id="c">Thirdamuno, ipsum dolor sit amet, consectetur adipiscing elit. Duis
                        elementum auctor accumsan. Duis pharetra
                        varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae.
                    </div>
                </div>
            </div>
            <!-- /tabs -->
        </div>

        <div class="col-md-6">
            <h3>Pills right</h3>

            <!-- tabs right -->
            <div class="tabbable">
                <ul class="nav nav-pills nav-stacked col-sm-3 col-sm-push-9">
                    <li class="active"><a href="#d" data-toggle="tab">One</a></li>
                    <li><a href="#e" data-toggle="tab">Two</a></li>
                    <li><a href="#f" data-toggle="tab">Twee</a></li>
                </ul>
                <div class="tab-content col-sm-9  col-sm-pull-3">
                    <div class="tab-pane active" id="d">Lorem ipsum dolor sit amet, rci quis tortor imperdiet
                        venenatischaretra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt
                        condimentum vitae, gravida a libero.</div>
                    <div class="tab-pane" id="e">Secondo sed ac orci quis tortor imperdiet venenatis. Duis elementum
                        auctor rci quis tortor imperdiet venenatis. Aliquam in felis sit amet augue.</div>
                    <div class="tab-pane" id="d">Thirdamuno, ipsum dolor sit amet, consectetur adipiscing elit. Duis
                        pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum
                        vitae. </div>
                </div>
            </div>
            <!-- /tabs -->

        </div> --}}

        <div class="my-account-accordion">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                <i class="fa fa-list-ol"></i>
                                Data Sheet
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="account-title">
                                        <div class="sidebar">
                                            <!-- categories start -->
                                            <a href="#" v-for="spec in productWiseSpec" class="blog-category">
                                                @{{spec.specification.name}} - @{{spec.description}}
                                            </a>
                                            <!-- categories end -->

                                        </div>
                                        <!-- sidebar end -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                                aria-expanded="false" aria-controls="collapseTwo">
                                <i class="fa fa-file-o"></i>
                                More Info
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="account-title">
                                        <h4 v-html="product.more_info"></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                                aria-expanded="false" aria-controls="collapseThree">
                                <i class="fa fa-building-o"></i>
                                Whats inside box
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="my-address">
                                        <p v-html="product.inside_box"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour"
                                aria-expanded="false" aria-controls="collapseFour">
                                <i class="fa fa-user"></i>
                                Reviews
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="delivery-details">
                                    <form action="#">
                                        <div class="list-style">

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <hr>

        <!-- random product section heading start -->
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading mt-40">
                    <div class="row">
                        <!-- section title start -->
                        <div class="col-md-9">
                            <h2> <img src="{{asset('themes/frontend/img/icon/icon_categories.png')}}" alt="">random
                                products</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- random product section heading end -->

        <!-- box items area start -->
        <div class="row mt-30">
            <div class="col-md-12">
                <div class="box-items">
                    <!-- box item start -->
                    <div v-bind:key="category.id" v-for="category in categories" class="box-item">
                        <!-- single box item start -->
                        <div class="single-box-item">
                            <div class="box-item-img">
                                <a href="#"><img :src="category.image || '/img/logo.png'" /></a>
                            </div>
                            <div class="box-content">
                                <a href="#">@{{category.name}}</a>
                                <ul class="item-list">
                                    <li><a href="shop.html" target="_blank">All-in-One Computers</a></li>
                                    <li><a href="shop.html" target="_blank">towers only</a></li>
                                    <li><a href="shop.html" target="_blank">Refurbished Desktops</a></li>
                                    <li><a href="shop.html" target="_blank">Gaming Desktops</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- single box item end -->
                    </div>
                    <!-- box item end -->

                </div>
            </div>
        </div>
        <!-- box items area end -->


    </div>
</div>
<!-- product details end -->
@endsection