 <!-- footer area start -->
 <footer class="footer-area mt-40">
    <div class="newsletter-area">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <div class="newsletter-title">
                        <h2>Sign Up for Newsletters</h2>
                        Get e-mail updates about our latest shop and special offers.
                    </div>
                </div>
                <div class="col-md-5 col-sm-7 xs-mt-20">
                    <div class="newsletter-form">
                        <form action="#" method="POST">
                            <input type="email" placeholder="enter your email">
                            <button type="submit">subscribe !</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-3 col-sm-5 xs-mt-20">
                    <div class="social-icons text-right">
                        <a href="https://www.facebook.com/Clicknet.SunwayPyramid/" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="https://youtu.be/b9YApJIGsmk" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="https://www.instagram.com/clicknet_sunwaypyramid/" target="_blank"><i class="fa fa-instagram"></i></a>
                        <a href="https://shopee.com.my/search?keyword=clicknet%20store" target="_blank"><img src="/img/Shoppe.png"/></a>
                        <a href="https://www.lazada.com.my/shop/clicknet-store/?spm=a2o4k.pdp.seller.1.59b67735PAAHXq" target="_blank"><img src="/img/lazada.png"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-widget-area">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-6 xs-mt-40">
                    <div class="widget-title">
                        <h3>about us</h3>
                    </div>
                    <div class="widget-address">
                        <p> <span> address : </span>Clicknet Technology Sdn Bhd, Unit 16, Digital Center, F1.39B, Sunway Pyramid, 3, Jalan PJS 11/15, Bandar Sunway, 46150 Subang Jaya, Selangor.</p>
                        <p> <span> Phone : </span> <a href="tel:0356120015"></a> 03 5612 0015</p>
                        <p> <span> Email : </span> <a href="mailto:sales@clicknet.com.my"></a>
                            sales@clicknet.com.my</p>
                    </div>
                </div>
                {{-- <div class="col-md-3 col-sm-6 xs-mt-40">
                    <div class="widget-title">
                        <h3>my account</h3>
                    </div>
                    <div class="widget-menu">
                        <a href="#">my orders</a>
                        <a href="#">my account</a>
                        <a href="#">my credit slips</a>
                        <a href="#">my addresses</a>
                        <a href="#">my personal info</a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 sm-mt-40 xs-mt-40">
                    <div class="widget-title">
                        <h3>information</h3>
                    </div>
                    <div class="widget-menu">
                        <a href="#">specials</a>
                        <a href="#">new products</a>
                        <a href="#">best sellers</a>
                        <a href="#">our stores</a>
                        <a href="#">contact us</a>
                    </div>
                </div> --}}
                <div class="col-md-3 col-sm-6 sm-mt-40 xs-mt-40">
                    <div class="widget-title">
                        <h3>categories</h3>
                    </div>
                    <div v-bind:key="category.id" v-for="category in categories" class="widget-menu">
                        <a href="#">@{{category.name}}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="footer-bottom-area">
            <div class="row">
                <div class="col-md-5 col-sm-12">
                    <div class="footer-copyright">
                        Copyright &copy; <a href="#">devitems</a>. All Rights Reserved
                    </div>
                </div>
                <div class="col-md-7 col-sm-12 sm-mt-40 text-right xs-mt-40">
                    {{-- <a href="#"><img src="{{asset('themes/frontend/img/payment.png')}}" alt=""></a> --}}
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer area end -->