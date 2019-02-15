<!-- Product item details Modal start -->
<div class="modal fade" id="confirm-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <!-- close button start -->
                <div class="close-button" data-dismiss="modal"><i class="fa fa-times-circle"></i></div>
                <!-- product modal details start -->
                <div class="product-modal">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="single-product-item floating">
                                <a href="#" @click.prevent="goToProduct(selectedProduct)" class="item-img">
                                    <img :src="getFirstImage(selectedProduct.image) || '/img/logo.png'" />
                                    <span v-show="selectedProduct.new" class="new"></span>
                                </a>
                                <div class="item-info">
                                    <h2><span class="item-title large">@{{selectedProduct.name}}</span></h2>
                                    <div class="info">
                                        <p>Reference: <span>@{{selectedProduct.reference}}</span></p>
                                        <p>Condition: <span>@{{selectedProduct.condition}}</span></p>
                                    </div>
                                    <h3 class="item-price"> RM@{{getPrice(selectedProduct.price - selectedProduct.discount_price)}}
                                        {{-- <span class="old-price">$30.51</span> --}}
                                    </h3>
                                    <p class="product-descriptions" v-html="selectedProduct.description"></p>
                                </div>
                            </div>
                        </div>
                        <div class="vl col-md-6">
                            <div class="mt-20">
                                <h3>Product successfully added to cart! </h3>
                            </div>
                            <div class="buttons mt-20">
                                <a href="#" class="stock">
                                    <span data-dismiss="modal">
                                        <i class="fa fa-angle-left"></i>continue shopping
                                    </span>
                                </a>
                                <a href="{{ URL::route('cart') }}" class="stock">
                                    <span> checkout
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                                <div class="single-product-item floating">

                                </div>
                                <div class="social-share">
                                    <a href="#" target="_blank"><i class="fa fa-twitter"></i> twitter</a>
                                    <a href="#" target="_blank"><i class="fa fa-facebook"></i> share</a>
                                    <a href="#" target="_blank"><i class="fa fa-google-plus"></i> Google+</a>
                                    <a href="#" target="_blank"><i class="fa fa-pinterest"></i> pinterest</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- single product item start -->

                    <!-- single product item end -->
                </div>
                <!-- product modal details end -->
            </div>
            <!-- close button end -->
        </div>
    </div>
</div>
<!-- Product item details Modal end -->