@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Download Pricelist'])

<!-- authentication content start -->
<div class="mt-40">
    <div class="container">
        <div v-if="!dealerAuth" class="row">
            <div class="col-md-6 sm-mt-40 xs-mt-40 col-md-offset-3">
                <div class="authentication">
                    <div class="border-title">
                        <h3>already registered?</h3>
                    </div>
                    <label for="email">Email address</label>
                    <input type="email" placeholder="email address" v-model="login.email"  name="email">
                    <label for="password">Password</label>
                    <input type="password" name="password" v-model="login.password" placeholder="password" >
                    <button type="submit" @click.prevent="dealerLogin()">sign in</button>
                </div>
            </div>
        </div>
        <div v-else>
            <div class="authentication">
                <div class="border-title">
                    <h3>Download Price List</h3>
                </div>
                <button type="submit" @click.prevent="downloadPriceList()">Download</button>
            </div>
        </div>
    </div>
</div>
<!-- authentication content end -->
@endsection