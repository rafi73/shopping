@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Contact'])

<!-- checkout area start -->
<div class="checkout-area mt-40">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- client address start -->
                <div class="client-address">
                    <!-- section title start -->
                    <div class="section-small-title">
                        <h3>Send a Message</h3>
                    </div>
                    <!-- section title start -->
                    <!-- client address form -->
                    <div class="client-address-form">
                        <form action="#">
                            <!-- input name -->
                            <input type="text" placeholder="Subject Heading">
                            <!--input email address-->
                            <input type="email" placeholder="Email Address">
                            <!-- input phone number -->
                            <input type="text" placeholder="Order Reference">
                            <!-- input company name -->
                            <input type="file" placeholder="Attach File">
                        </form>
                    </div>
                </div>
                <!-- client address end -->
            </div>
            <div class="col-md-6 sm-mt-40 xs-mt-40">
                <div class="client-address">
                    <div class="section-small-title">
                        <h3>&nbsp;</h3>
                    </div>
                    <div class="client-address-form">
                        <!-- input your details address -->
                        <textarea class="message" rows="9" placeholder="Message"></textarea>
                    </div>
                </div>
            </div>
        </div>
         <!-- cart table end -->
         <div class="buttons mt-20">
            <a href="#" class="stock"> 
                <span> Send 
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
</div>
<!-- checkout area end -->
@endsection