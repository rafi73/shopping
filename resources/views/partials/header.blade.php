<!-- header start -->
<header>
    <!-- header top start -->
    <div class="header-top-area">
        <div class="container container-header">
            <div class="row">
                <div class="top-content">
                    <div class="col-lg-6">
                        <div class="header-address">
                            <span>Hotline:</span>
                            <a href="tel:0123456789"> 03 5612 0015</a>
                        </div>
                        <div class="header-address">
                            <span>Email:</span>
                            <a href="mailto:sales@yourcompany.com">sales@clicknet.com.my</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header-menu">
                            <ul>
                                {{-- <li><a href="#">languages <span>English <i class="fa fa-angle-down"></i>
                                        </span></a>
                                    <ul>
                                        <li><a href="#"><img src="{{asset('themes/frontend/img/languages/1.jpg')}}" alt="">
                                                English </a></li>
                                        <li><a href="#"><img src="{{asset('themes/frontend/img/languages/2.jpg')}}" alt="">
                                                Arab </a></li>
                                    </ul>
                                </li>
                                <li><a href="#">currenct <span>USD <i class="fa fa-angle-down"></i> </span></a>
                                    <ul>
                                        <li><a href="#">Dollar(USD)</a></li>
                                        <li><a href="#">Euro(EUR)</a></li>
                                    </ul>
                                </li> --}}
                                <li v-if="loggedInCustomer.name">
                                    <a href="#">
                                        <span> @{{loggedInCustomer.name}}
                                        </span>
                                    </a>
                                </li>
                                <li v-if="loggedInCustomer.name">
                                    <a href="#" @click.prevent="customerLogout()">
                                        <span> Logout
                                        </span>
                                    </a>
                                </li>
                                <li v-else>
                                    <a href="{{ URL::route('authentication') }}">
                                        <span> Login
                                        </span>
                                    </a>
                                </li>

                                {{-- <li><a href="#">My Account <i class="fa fa-angle-down"></i> </a>
                                    <ul>
                                        <li><a href="#">my account</a></li>
                                        <li><a href="#">my wishlist</a></li>
                                        <li><a href="#">checkout</a></li>
                                        <li><a href="#">login</a></li>
                                    </ul>
                                </li> --}}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- header top end -->

    <!-- main header start -->
    <div class="main-header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <!-- logo start -->
                    <a href="{{ URL::route('home') }}"> <img src="{{asset('themes/frontend/img/logo.png')}}" alt="" class="logo"></a>
                    <!-- logo end -->
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-sm-8">
                            <!-- category bar start -->
                            <div class="catagory-bar">
                                <div class="header-search">
                                    <form action="#" method="GET">
                                        <input type="text" v-model="searchTerm" @keyup.enter.native="goToSearch(searchTerm)" placeholder="Search entire store here ...">

                                        <button @click.prevent="goToSearch(searchTerm)" type="submit">
                                            <i class="zmdi zmdi-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <!-- category bar end -->
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-4">
                            <!-- total cart start -->
                            <div class="total-cart">
                                <div class="cart-button">
                                    <a href="#">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                        <strong> MY CART </strong>
                                        <div class="cart-quantity">@{{cartProducts.length}}</div>
                                        <span class="price"></span>
                                        RM@{{totalPrice}}
                                    </a>
                                </div>
                                <div v-if="cartProducts.length" class="cart-item">
                                    <div v-bind:key="product.id" v-for="product in cartProducts" class="single-item">
                                        <div class="item-img">
                                            <a href="#" @click.prevent="goToProduct(product)">
                                                <img :src="getFirstImage(product.image) || '/img/logo.png'" />
                                            </a>
                                        </div>
                                        <div class="item-info">
                                            <a href="#" @click.prevent="goToProduct(product)" class="title">
                                                <span>@{{product.quantity}} x </span>
                                                @{{product.name}}
                                            </a>
                                            <a href="#">S,</a>
                                            <a href="#"> Yellow</a>
                                            <span>RM@{{getPrice(product.price - product.discount_price)}}</span>
                                        </div>
                                        <span class="single-item-remove" @click.precent="removeProduct(product)">x</span>
                                    </div>
                                    <div class="subtotal">
                                        <h3> Tax: <span>RM0.00</span> </h3>
                                        <h3> Shipping: <span>RM0.00</span> </h3>
                                        <h3> Total: <span>RM@{{totalPrice}}</span> </h3>
                                    </div>
                                    <div class="checkout">
                                        <a href="{{ URL::route('cart') }}"> check out <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- total cart end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- main header end -->

    <!-- header bottom start -->
    <div id="sticker" class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <!-- category menu start -->
                    <div class="catagory-menu hidden-sm hidden-xs">
                        <div class="catagory-heading">
                            <h2>all categories</h2>
                        </div>
                        <div class="catagory-list-menu hidden-menu">
                            <ul>
                                <li v-bind:key="category.id" v-for="category in categories" v-bind:class="category.sub_categories.length ? 'arrow': ''">
                                    <a href="#" @click.prevent="goToCategory(category)">
                                        {{-- <img src="{{asset('themes/frontend/img/menu-icon/10.jpg')}}" alt=""> --}}
                                        @{{category.name}}
                                    </a>
                                    <!-- category sub menu start -->
                                    <ul v-if="category.sub_categories.length" class="c-sub-menu">
                                        <li v-if="subcategory" v-bind:key="subcategory.id" v-for="subcategory in category.sub_categories">
                                            <a href="#" @click.prevent="goToSubCategory(subcategory)">@{{subcategory.name}}</a>
                                        </li>
                                    </ul>
                                    <!-- category sub menu end -->
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- category menu end -->
                </div>
                <div class="col-md-9">
                    <div class="mainmenu hidden-xs">
                        <ul>
                            <li><a href="{{ URL::route('home') }}">Home</a></li>
                            <li><a href="{{ URL::route('about') }}">About Us</a></li>
                            {{-- <li><a href="{{ URL::route('dealer') }}">Become a dealer</a></li> --}}
                            <li><a href="{{ URL::route('quotation') }}">Quotation</a></li>
                            <li><a href="{{ URL::route('pricelist') }}">Pricelist</a></li>
                            <li><a href="{{ URL::route('contact') }}">Contact</a></li>
                        </ul>
                    </div>
                    <div id="mobileMenu"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- header bottom end -->
</header>
<!-- header end -->