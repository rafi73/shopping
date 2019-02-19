<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- favicon -->
    <link rel="shortcut icon" href="../images/favicon.ico">
    <title>Clicknet</title>


    @section('css')
    <!-- All CSS
        ============================================ -->
    <!-- normalize css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/normalize.css')}}">

    <!-- font-awesome css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/font-awesome.min.css')}}">

    <!-- material css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/material-design-iconic-font.min.css')}}">

    <!-- bootstrap css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/bootstrap.min.css')}}">

    <!-- animate css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/animate.css')}}">

    <!-- TimeCircles css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/TimeCircles.css')}}">

    <!-- owl carousel css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/owl.carousel.css')}}">

    <!-- slicknav css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/slicknav.min.css')}}">

    <!-- nivo-slider css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/lib/css/nivo-slider.css')}}">
    <link rel="stylesheet" href="{{asset('themes/frontend/lib/css/preview.css')}}">

    <!-- jquery ui css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/jquery-ui.css')}}">

    <!-- style css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/style.css')}}">

    <!-- responsive css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/responsive.css')}}">

    <!-- user custom css
        ============================================ -->
    <link rel="stylesheet" href="{{asset('themes/frontend/css/custom.css')}}">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- modernizr-2 js
        ============================================ -->
    <script src="{{asset('themes/frontend/js/vendor/modernizr-2.8.3.min.js')}}"></script>

    <!-- user custom css
        ============================================ -->
        <link rel="stylesheet" href="{{asset('themes/frontend/css/image-zoom/main.css')}}">
        <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        



    @show

    <script>
        window.Laravel = {!! json_encode(['csrfToken' => csrf_token(),])!!};
    </script>
</head>

<body>
    <div id="app">
        @include('partials.addedToCartModal')
        
        @include('partials.header')

        <div>
            @yield('content')
        </div>

        @include('partials.singleProductModal')

        @include('partials.footer')
    </div>

    @section('js')

    {{--
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script> --}}

    <script src="{{asset('vue.js')}}"></script>
    <script src="{{asset('axios.js')}}"></script>

    {{--
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script> --}}

    <!-- All JS
            =========================================== -->
    <!-- JQuery library
            =========================================== -->
    <script src="{{asset('themes/frontend/js/jquery-1.12.4.min.js')}}"></script>

    <!-- Bootstrap js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/bootstrap.min.js')}}"></script>

    <!-- price slider js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/jquery-price-slider.js')}}"></script>

    <!-- TimeCircles js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/TimeCircles.js')}}"></script>

    <!-- easing js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/jquery.easing.js')}}"></script>

    <!-- slicknav js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/jquery.slicknav.min.js')}}"></script>

    <!-- owl carousel js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/owl.carousel.min.js')}}"></script>

    <!-- nivo.slider js
            =========================================== -->
    <script src="{{asset('themes/frontend/lib/js/jquery.nivo.slider.js')}}"></script>
    {{-- <script src="{{asset('themes/frontend/lib/home.js')}}"></script> --}}

    <!-- plugins js
            =========================================== -->
    <script src="{{asset('themes/frontend/js/plugins.js')}}"></script>

    <!-- Main js
            =========================================== -->

    <script src="{{asset('themes/frontend/js/main.js')}}"></script>

    {{-- <script src="{{asset('themes/frontend/js/image-zoom/main.js')}}"></script>
    <script src="{{asset('themes/frontend/js/image-zoom/zoom-image.js')}}"></script> --}}



    <script>
        new Vue({
            el: '#app',
            data: {
                message: 'hellow world',
                categories: [],
                brands: [],
                products: [],
                selectedProduct: {},
                cartProducts: [],
                total: 0,
                products: [],
                product: {},
                category: {},
                brand: {},
                categoryWiseProducts: [],
                subCategoryWiseProducts: [],
                searchTerm: null,
                searchedProducts: [],
                register:{
                    name: null,
                    email: null,
                    password: null,
                    is_dealer: false,
                    active: true
                },
                login:{
                    email:null,
                    password: null
                },
                loggedInCustomer: {
                    name: null
                },
                productWiseSpec: [],
                order: {
                    customer: {}
                },
                dealerAuth: false,
                quoteRequest: {},
                billing: {},
                shipping: {},
                VAT: 15

            },
            created() {
                this.loggedInCustomer =  localStorage.getItem('customer') ?  JSON.parse(localStorage.getItem('customer')) : {}
                console.log('loggedInCustomer', this.loggedInCustomer)
                //localStorage.removeItem('cart')
                //localStorage.removeItem('cart')
                console.log('Testing console. from Home')
                this.getCartProducts()
                this.getCategories()
                this.getProducts()

                console.log(window.location.pathname)

                if (window.location.pathname == '/') {
                    this.getBrands()
                }

                else if (window.location.pathname.split('/')[1] == 'product') {
                    let productId = window.location.pathname.split('/')[2]
                    this.getProduct(productId)
                }

                else if (window.location.pathname.split('/')[1] == 'brand') {
                    let brandId = window.location.pathname.split('/')[2]
                    this.getBrand(brandId)
                }

                else if (window.location.pathname.split('/')[1] == 'category') {
                    let categoryId = window.location.pathname.split('/')[2]
                    this.getCategorywiseProducts(categoryId)
                }

                else if (window.location.pathname.split('/')[1] == 'sub-category') {
                    let subCategoryId = window.location.pathname.split('/')[2]
                    this.getSubCategorywiseProducts(subCategoryId)
                }

                else if (window.location.pathname.split('/')[1] == 'search') {
                    let term = window.location.pathname.split('/')[2]
                    this.searchProduct(term)
                    this.searchTerm = term
                }

                else if (window.location.pathname.split('/')[1] == 'pricelist') {
                    if(this.loggedInCustomer.is_dealer == 1)
                        this.dealerAuth = true
                }

                else if (window.location.pathname.split('/')[1] == 'invoice') {
                    let orderId = window.location.pathname.split('/')[2]
                    this.getOrder(orderId)
                }

                 else if (window.location.pathname.split('/')[1] == 'checkout') {
                    this.billing = Object.assign({}, this.loggedInCustomer)
                    this.shipping = Object.assign({}, this.loggedInCustomer)
                }
            },
            mounted: function () {
                let ref = this
                Vue.nextTick(function () {

                    $('#nivoslider').nivoSlider({
                        effect: 'random',
                        slices: 15,
                        boxCols: 8,
                        boxRows: 4,
                        animSpeed: 500,
                        pauseTime: 5000,
                        startSlide: 0,
                        directionNav: false,
                        controlNavThumbs: false,
                        controlNav: true,
                        pauseOnHover: true,
                        manualAdvance: false
                    });

                    /*====================
                    00. Top banner hide
                    =====================*/

                    $('.close-section-btn').on('click', function () {
                        $(this).parents('.top-banner-area').addClass('hide-top-banner');
                    });

                    /*******************
                    01. Top Menu Stick
                    ********************/
                    var sticky_menu = $('#sticker, #sticker-mobile');
                    var pos = sticky_menu.position();
                    if (sticky_menu.length) {
                        var windowpos = sticky_menu.offset().top;
                        $(window).on('scroll', function () {
                            var windowpos = $(window).scrollTop();
                            if (windowpos > pos.top) {
                                sticky_menu.addClass('stick');
                            } else {
                                sticky_menu.removeClass('stick');
                            }
                        });
                    }

                    /*******************
                    02. jQuery SlickNav
                    ********************/
                    $('.mainmenu').slicknav({
                        label: 'menu',
                        duration: 700,
                        easingOpen: "easeOutBounce",
                        prependTo: '#mobileMenu',
                        closeOnClick: true
                    });

                    /*******************
                    03. Url Active Class
                    ********************/
                    $(function () {
                        var pgurl = window.location.href.substr(window.location.href
                            .lastIndexOf("/") + 1);
                        $(".mainmenu a").each(function () {
                            if ($(this).attr("href") === pgurl || $(this).attr("href") === '')
                                $(this).addClass("active");
                        })
                    });

                    /*********** li active class ***********/
                    var cururl = window.location.pathname;
                    var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);
                    var hash = window.location.hash.substr(1);
                    if ((curpage === "" || curpage === "/" || curpage === "admin") && hash === "") {
                        //$("mainmenu ul > li:first-child").addClass("active");
                    }
                    else {
                        $(".mainmenu li").each(function () {
                            $(this).removeClass("active");
                        });
                        if (hash != "")
                            $(".mainmenu li a[href*='" + hash + "']").parents("li").addClass("active");
                        else
                            $(".mainmenu li a[href*='" + curpage + "']").parents("li").addClass("active");
                    }


                    /*******************
                    04. SmoothSroll
                    ********************/
                    $('.smooth, .smooth-scroll a').on('click', function (event) {
                        var $anchor = $(this);
                        var div = $('body div');
                        if (div.has('#sticker')) {
                            var headerH = '25';
                        } else {
                            var headerH = '-41';
                        }
                        $('html, body').stop().animate({
                            'scrollTop': $($anchor.attr('href')).offset().top - headerH + "px"
                        }, 1200, 'easeInOutExpo');
                        event.preventDefault();
                    });

                    /*******************
                    05. Scrollspy
                    ********************/
                    $('body').scrollspy({ target: '.navbar-collapse', offset: 95 });

                    /*******************
                    06. Category menu
                    ********************/

                    $('.catagory-heading').click(function () {
                        $('.catagory-list-menu').slideToggle();
                    });

                    $('.sort-catagory-title').click(function () {
                        $('.catagary-element').slideToggle();
                    });

                    $('.more-catagory').click(function () {
                        $(this).hide();
                        $('.more-catagory-item , .less-catagory ').slideDown();
                    });

                    $('.less-catagory').click(function () {
                        $('.more-catagory-item').slideUp();
                        $('.more-catagory').show();
                        $(this).hide();
                    });

                    /*******************
                    07. DateCount
                    ********************/

                    $(".DateCountdown").TimeCircles({
                        "animation": "ticks",
                        "bg_width": 0.3,
                        "fg_width": 0.013333333333333334,
                        "circle_bg_color": "#60686F",
                        "time": {
                            "Days": {
                                "text": "Days",
                                "color": "#F9ba48",
                                "show": true
                            },
                            "Hours": {
                                "text": "Hours",
                                "color": "#F9ba48",
                                "show": true
                            },
                            "Minutes": {
                                "text": "Mins",
                                "color": "#F9ba48",
                                "show": true
                            },
                            "Seconds": {
                                "text": "Secs",
                                "color": "#F9ba48",
                                "show": true
                            }
                        }
                    });

                    /*******************
                    08. Deals Items
                    ********************/

                    $(".deals-day-items, .hot-deals-item").owlCarousel({
                        items: 1,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                    });

                    /*******************
                    09. New arrival Item style 2
                    ********************/

                    $(".new-arrival-items.style-2").owlCarousel({
                        items: 1,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 1,
                            }
                        }
                    });

                    /*******************
                    10. New arrival Items
                    ********************/

                    $(".new-arrival-items").owlCarousel({
                        items: 1,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 1,
                            }
                        }
                    });

                    /*******************
                    11. Multiple Items (Random Products)
                    ********************/

                    $(".multiple-items.random-products").owlCarousel({
                        items: 4,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 3,
                            },
                            // breakpoint from 768 up
                            1200: {
                                items: 4,
                            }
                        }

                    });

                    /*******************
                    12. Multiple Items
                    ********************/

                    $(".multiple-items").owlCarousel({
                        items: 4,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 3,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 4,
                            }
                        }

                    })

                    /*******************
                    14. Different Items
                    ********************/

                    $(".different-items").owlCarousel({
                        items: 3,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 3,
                            }
                        }

                    });

                    /*******************
                    15. Blog Slider
                    ********************/

                    $(".blog-posts-slider").owlCarousel({
                        items: 2,
                        margin: 30,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 2,
                            }
                        }
                    });

                    /*******************
                    16. Clients Logo
                    ********************/

                    $(".clients-logo").owlCarousel({
                        items: 2,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                    });

                    /*******************
                    17. Bos Items 2
                    ********************/

                    $(".box-items-2").owlCarousel({
                        items: 2,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 2,
                            }
                        }
                    });

                    /*******************
                    18. Price Slider
                    ********************/

                    $("#slider-range").slider({
                        range: true,
                        min: 15,
                        max: 30,
                        values: [15, 30],
                        slide: function (event, ui) {
                            $("#amount").val("$" + ui.values[0] + " -- $" + ui.values[1]);
                        }
                    });
                    $("#amount").val("$" + $("#slider-range").slider("values", 0) + " -- $" + $("#slider-range").slider("values", 1));


                    /*******************
                    19. Cart Plus Minus
                    ********************/

                    $(".cart-plus-minus").append('<div class="dec qtybutton">-</div><div class="inc qtybutton">+</div>');
                    $(".qtybutton").on("click", function () {
                        var $button = $(this);
                        var oldValue = $button.parent().find("input").val();
                        if ($button.text() == "+") {
                            var newVal = parseFloat(oldValue) + 1;
                        } else {
                            // Don't allow decrementing below zero
                            if (oldValue > 0) {
                                var newVal = parseFloat(oldValue) - 1;
                            } else {
                                newVal = 0;
                            }
                        }
                        $button.parent().find("input").val(newVal);
                    });

                    /*******************
                    20. ScrollUp
                    ********************/

                    //Check to see if the window is top if not then display button
                    $(window).on("scroll", function () {
                        if ($(this).scrollTop() > 700) {
                            $('#scrollUp').fadeIn().parent('ul').addClass('scroll-visible');
                        } else {
                            $('#scrollUp').fadeOut().parent('ul').removeClass('scroll-visible');
                        }
                    });

                    //Click event to scroll to top
                    $('#scrollUp').on("click", function () {
                        $('html, body').animate({ scrollTop: 0 }, 800);
                        return false;
                    });

                    $.fn.zoomImage = function(paras) {
        /**
         * 默认参数
         */
        var defaultParas = {
            layerW: 100, // 遮罩宽度
            layerH: 100, // 遮罩高度
            layerOpacity: 0.2, // 遮罩透明度
            layerBgc: '#000', // 遮罩背景颜色
            showPanelW: 500, // 显示放大区域宽
            showPanelH: 500, // 显示放大区域高
            marginL: 5, // 放大区域离缩略图右侧距离
            marginT: 0 // 放大区域离缩略图上侧距离
        };

        paras = $.extend({}, defaultParas, paras);

        $(this).each(function() {
            var self = $(this).css({position: 'relative'});
            var selfOffset = self.offset();
            var imageW = self.width(); // 图片高度
            var imageH = self.height();

            self.find('img').css({
                width: '100%',
                height: '100%'
            });

            // 宽放大倍数
            var wTimes = paras.showPanelW / paras.layerW;
            // 高放大倍数
            var hTimes = paras.showPanelH / paras.layerH;

            // 放大图片
            var img = $('<img>').attr('src', self.attr("href")).css({
                position: 'absolute',
                left: '0',
                top: '0',
                width: imageW * wTimes,
                height: imageH * hTimes
            }).attr('id', 'big-img');

            // 遮罩
            var layer = $('<div>').css({
                display: 'none',
                position: 'absolute',
                left: '0',
                top: '0',
                backgroundColor: paras.layerBgc,
                width: paras.layerW,
                height: paras.layerH,
                opacity: paras.layerOpacity,
                border: '1px solid #ccc',
                cursor: 'crosshair'
            });

            // 放大区域
            var showPanel = $('<div>').css({
                display: 'none',
                position: 'absolute',
                overflow: 'hidden',
                left: imageW + paras.marginL,
                top: paras.marginT,
                width: paras.showPanelW,
                height: paras.showPanelH
            }).append(img);

            self.append(layer).append(showPanel);

            self.on('mousemove', function(e) {
                // 鼠标相对于缩略图容器的坐标
                var x = e.pageX - selfOffset.left;
                var y = e.pageY - selfOffset.top;

                if(x <= paras.layerW / 2) {
                    x = 0;
                }else if(x >= imageW - paras.layerW / 2) {
                    x = imageW - paras.layerW;
                }else {
                    x = x - paras.layerW / 2;
                }

                if(y < paras.layerH / 2) {
                    y = 0;
                } else if(y >= imageH - paras.layerH / 2) {
                    y = imageH - paras.layerH;
                } else {
                    y = y - paras.layerH / 2;
                }

                layer.css({
                    left: x,
                    top: y
                });

                img.css({
                    left: -x * wTimes,
                    top: -y * hTimes
                });
            }).on('mouseenter', function() {
                layer.show();
                showPanel.show();
            }).on('mouseleave', function() {
                layer.hide();
                showPanel.hide();
            });
        });
    }
                }.bind(ref))
            },
            methods: {
                getCartProducts() {
                    if (localStorage.getItem("cart")) {
                        json = JSON.parse(localStorage.getItem("cart"))

                        //var arr = []
                        for (var prop in json) {
                            this.cartProducts.push(json[prop])
                            this.total = this.total + parseFloat(json[prop].price)
                        }
                        console.log(this.cartProducts)
                    }
                },
                getBrands() {
                    let ref = this
                    axios.get(`/api/frontend-brands`)
                        .then(function (response) {
                            console.log(response)
                            ref.brands = response.data.data

                            Vue.nextTick(function () {
                                ref.installProductsCarousel()
                            }.bind(ref))
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                goToProduct(product) {
                    console.log(product)
                    let url = "{{ route('product', ':id') }}"
                    url = url.replace(':id', product.id)
                    document.location.href = url
                },
                goToBrand(brand) {
                    console.log(brand)
                    let url = "{{ route('brand', ':id') }}"
                    url = url.replace(':id', brand.id)
                    document.location.href = url
                },
                goToCategory(category) {
                    console.log(category)
                    let url = "{{ route('category', ':id') }}"
                    url = url.replace(':id', category.id)
                    document.location.href = url
                },
                goToSubCategory(subCategory) {
                    console.log(subCategory)
                    let url = "{{ route('sub-category', ':id') }}"
                    url = url.replace(':id', subCategory.id)
                    document.location.href = url
                },
                goToInvoice(order) {
                    console.log(order)
                    let url = "{{ route('invoice', ':id') }}"
                    url = url.replace(':id', order.id)
                    document.location.href = url
                },
                addToCart(product) {
                    this.selectedProduct = product
                    if (localStorage.getItem("cart")) {
                        json = JSON.parse(localStorage.getItem("cart"))
                        this.cartProducts = []
                        for (var prop in json) {
                            this.cartProducts.push(json[prop])
                        }
                    }

                    let cartProduct = this.cartProducts.find(x => x.id === product.id)
                    if (cartProduct) {
                        cartProduct.quantity = parseInt(cartProduct.quantity + 1)
                    }
                    else {
                        product.quantity = 1
                        this.cartProducts.push(product)
                    }

                    localStorage.setItem("cart", JSON.stringify(this.cartProducts))
                },
                singleProductModal(product) {
                    console.log(product)
                    this.selectedProduct = product
                },
                removeProduct(product) {
                    if (localStorage.getItem("cart")) {
                        json = JSON.parse(localStorage.getItem("cart"))
                        this.cartProducts = []
                        for (var prop in json) {
                            this.cartProducts.push(json[prop])
                        }
                    }
                    this.cartProducts = this.cartProducts.filter(function (obj) {
                        return obj.id !== product.id
                    })

                    localStorage.setItem("cart", JSON.stringify(this.cartProducts))
                },
                getCategories() {
                    let ref = this
                    axios.get(`/api/frontend-categories`)
                        .then(function (response) {
                            ref.categories = response.data.data
                            console.log('categories',  ref.categories)

                            Vue.nextTick(function () {
                                ref.installCategoriesCarousel()
                            }.bind(ref))
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getProducts() {
                    let ref = this
                    axios.get(`/api/frontend-products`)
                        .then(function (response) {
                            console.log(response)
                            ref.products = response.data.data
                            

                            Vue.nextTick(function () {
                                ref.installNewArrivalCarousel()
                            }.bind(ref))
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getProduct(id) {
                    let ref = this
                    axios.get(`/api/frontend-product/${id}`)
                        .then(function (response) {
                            ref.product = response.data.product
                            ref.productWiseSpec = response.data.productWiseSpec

                            ref.product.quantity = 1
                            console.log(response)
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getBrand(id) {
                    let ref = this
                    axios.get(`/api/frontend-brand/${id}`)
                        .then(function (response) {
                            ref.brand = response.data.data
                            console.log(response)
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getOrder(id) {
                    let ref = this
                    axios.get(`/api/frontend-order/${id}`)
                        .then(function (response) {
                            ref.order = response.data.data
                            console.log(response)
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getCategorywiseProducts(categoryId) {
                    let ref = this
                    axios.get(`/api/frontend-category-wise-products/${categoryId}`)
                        .then(function (response) {
                            console.log(response)
                            ref.categoryWiseProducts = response.data.data
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                getSubCategorywiseProducts(subCategoryId) {
                    let ref = this
                    axios.get(`/api/frontend-sub-category-wise-products/${subCategoryId}`)
                        .then(function (response) {
                            console.log(response)
                            ref.subCategoryWiseProducts = response.data.data
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                installProductsCarousel: function () {
                    var owl = $('.products');
                    owl.owlCarousel({
                        items: 4,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 3,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 4,
                            }
                        }
                    })

                    $('body').scrollspy({ target: '.navbar-collapse', offset: 95 })
                },
                installCategoriesCarousel: function () {
                    $(".box-items").owlCarousel({
                        items: 3,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 480 up
                            480: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 3,
                            }
                        }

                    })
                },
                installNewArrivalCarousel: function () {
                    $(".new-arrival-items").owlCarousel({
                        items: 1,
                        nav: true,
                        dots: false,
                        autoplay: false,
                        loop: true,
                        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                        mouseDrag: false,
                        touchDrag: false,
                        responsive: {
                            // breakpoint from 0 up
                            0: {
                                items: 1,
                            },
                            // breakpoint from 768 up
                            768: {
                                items: 2,
                            },
                            // breakpoint from 768 up
                            1024: {
                                items: 1,
                            }
                        }
                    })
                },
                goToSearch(term){
                    console.log(term)
                    let url = "{{ route('search', ':id') }}"
                    url = url.replace(':id', term)
                    document.location.href = url
                },
                searchProduct(term){
                    let ref = this
                    axios.get(`/api/frontend-search-products/${term}`)
                        .then(function (response) {
                            console.log(response)
                            ref.searchedProducts = response.data.data
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                },
                customerRegistration(){
                    console.log(this.register)

                    if(this.register.password !== this.register.confirmPassword){
                        alert('Password and Confirm password are not same!')
                        return
                    }
                    axios.post('/api/customer-register', this.register)
                    .then(
                        (response) => {
                            console.log(response)
                            if(response){
                                this.loggedInCustomer = response.data.data
                                localStorage.setItem('customer', JSON.stringify(this.loggedInCustomer))
                                document.location.href = "{{ route('checkout') }}"
                            }
                        }
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                            
                        }
                    )
                },
                customerLogin(){
                    let ref = this
                    axios.post('/api/customer-login', this.login)
                    .then(
                        (response) => {
                            console.log(response)
                            if(response.data){
                                this.loggedInCustomer = response.data.data
                                localStorage.setItem('customer', JSON.stringify(this.loggedInCustomer))

                                if(ref.cartProducts.length)
                                    document.location.href = "{{ route('checkout') }}"
                                else    
                                    document.location.href = "{{ route('home') }}"
                            }
                            else    
                                alert('Email or Password error!')
                        }   
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                        }
                    )
                },
                customerLogout(){
                    localStorage.removeItem('customer')
                    this.loggedInCustomer = {}
                },
                submitOrder(cartProducts){
                    console.log(cartProducts)
                    let order = {}
                    order.details = cartProducts
                    order.customer_id = this.loggedInCustomer.id
                    order.total = parseFloat(this.totalPrice.replace(/,/g, ''))
                    order.billing = this.billing
                    order.shipping = this.shipping
                    order.vat = parseFloat(this.totalVat.replace(/,/g, '')) 
                    
                    axios.post('/api/place-order', order)
                    .then(
                        (response) => {
                            console.log(response)
                            let order = response.data.data
                            alert('Order Placed successfully!')
                            this.cartProducts = []
                            localStorage.removeItem('cart')
                            this.goToInvoice(order)
                        }   
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                        }
                    )
                },
                goToCheckout(){
                    if(localStorage.getItem('customer'))
                        document.location.href = "{{ route('checkout') }}"
                    else    
                        document.location.href = "{{ route('authentication') }}"
                },
                dealerRegistration(){
                    console.log(this.register)

                    if(this.register.password !== this.register.confirmPassword){
                        alert('Password and Confirm password are not same!')
                        return
                    }
                    axios.post('/api/dealer-register', this.register)
                    .then(
                        (response) => {
                            console.log(response)
                            if(response){
                                this.loggedInCustomer = response.data.data
                                localStorage.setItem('customer', JSON.stringify(this.loggedInCustomer))
                                //document.location.href = "{{ route('checkout') }}"
                            }
                            
                        }
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                            
                        }
                    )
                },
                dealerLogin(){
                    let ref = this
                    axios.post('/api/dealer-login', this.login)
                    .then(
                        (response) => {
                            console.log(response)
                            if(response.data){
                                console.log(response)
                                this.loggedInCustomer = response.data.data
                                localStorage.setItem('customer', JSON.stringify(this.loggedInCustomer))

                                this.dealerAuth = true
                            }
                            else    
                                alert('Email or Password error!')
                        }   
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                        }
                    )
                },
                sendQuoteRequest(quoteRequest){
                    console.log(quoteRequest)
                    axios.post('/api/quote-request', quoteRequest)
                    .then(
                        (response) => {
                            console.log(response)
                            let order = response.data.data
                            alert('Request sent successfully!')
                            this.quoteRequest = {}
                        }   
                    )
                    .catch(
                        (error) => {
                            console.log(error)
                        }
                    )
                },
                downloadPriceList(){
                    window.location.href = '/api/price-list/download'
                },
                isNumber: function(evt) {
                    evt = (evt) ? evt : window.event
                    var charCode = (evt.which) ? evt.which : evt.keyCode
                    if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                        evt.preventDefault()
                    } 
                    else {
                        this.$nextTick(() => {
                            localStorage.setItem("cart", JSON.stringify(this.cartProducts))
                        })
                        return true
                    }
                },
                getPrice(price){
                    return parseFloat(price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                },
                getFirstImage(images){
                    if(images){
                        return images.toString().split(',')[0]
                    }
                }
            },
            computed: {
                totalPrice() {
                    return this.getPrice(this.cartProducts.reduce((acc, item) => acc + parseFloat((item.price - item.discount_price) * item.quantity), 0))
                },
                totalVat() {
                    return this.getPrice((this.cartProducts.reduce((acc, item) => acc + parseFloat((item.price - item.discount_price) * item.quantity), 0))  - 
                                        (this.cartProducts.reduce((acc, item) => acc + parseFloat((item.price - item.discount_price) * item.quantity), 0))/ (1 + (this.VAT / 100)))
                }
            }
        })
    </script>
    @show
</body>

</html>