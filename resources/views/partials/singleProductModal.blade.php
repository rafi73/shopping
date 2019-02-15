<!-- Product item details Modal start -->
<div class="modal fade" id="item-modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <!-- close button start -->
                <div class="close-button" data-dismiss="modal"><i class="fa fa-times-circle"></i></div>
                <!-- product modal details start -->
                <div class="product-modal">
                    <!-- single product item start -->
                    <div class="single-product-item floating">
                        <a href="#" @click.prevent="goToProduct(selectedProduct)" class="item-img">
                            <img :src="selectedProduct.image || '/img/logo.png'" />
                            <span class="sale"></span>
                        </a>
                        <div class="item-info">
                            <h2><span class="item-title large">@{{selectedProduct.name}}</span></h2>
                            <div class="info">
                                <p>Reference: <span>@{{selectedProduct.reference}}</span></p>
                                <p>Condition: <span>@{{selectedProduct.condition}}</span></p>
                            </div>
                            <h3 class="item-price"> @{{selectedProduct.price}}
                                {{-- <span class="old-price">$30.51</span> --}}
                            </h3>
                            <p class="product-descriptions">@{{selectedProduct.description}}</p>
                            <!-- <div class="cart-plus-minus">
                                <label>Quantity: </label>
                                <input class="cart-plus-minus-box" type="text" name="qtybutton" value="1">
                            </div> -->
                            <div >
                                <label>Quantity: </label> 
                                <input type="text" name="qtybutton" v-model="selectedProduct.quantity" class="cart-plus-minus-box">
                                <div  class="dec qtybutton">-</div>
                                <div class="inc qtybutton">+</div>
                                <a href="#" @click.prevent="addToCart(selectedProduct)" class="single-action">add to cart</a>
                            </div>
                            <div class="actions">
                               
                                {{-- <a href="#" class="single-action"> <i class="fa fa-envelope"></i> </a>
                                <a href="#" class="single-action"> <i class="fa fa-print"></i> </a>
                                <a href="#" class="single-action"> <i class="zmdi zmdi-favorite-outline"></i></a> --}}
                            </div>
                            <div class="stock">
                                <p> 300 Items <span>In stock</span></p>
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
                <!-- product modal details end -->
            </div>
            <!-- close button end -->
        </div>
    </div>
</div>
<!-- Product item details Modal end -->