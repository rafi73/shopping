@extends('frontend')
@section('content')

@include('partials.breadcrumb', ['pageName' => 'Authentication'])

<!-- authentication content start -->
<div class="mt-40">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="authentication">
                    <div class="border-title">
                        <h3>create an account</h3>
                    </div>
                    <p>Please enter your email address to open an account</p>
                    <label for="name" class="mt-10">Name</label>
                    <input type="text" v-model="register.name" placeholder="name"  name="name">
                    <label for="email" class="mt-10">Email </label>
                    <input type="email" v-model="register.email" placeholder="email address"  name="email">
                    <label for="password">Password</label>
                    <input type="password" v-model="register.password" name="password" placeholder="password" >
                    <label for="password">Confirm Password</label>
                    <input type="password" v-model="register.confirmPassword" name="password" placeholder="password">
                    <label for="name" class="mt-10">Phone</label>
                    <input type="text" v-model="register.phone" placeholder="phone"  name="phone">
                    <label for="name" class="mt-10">Company</label>
                    <input type="text" v-model="register.company" placeholder="company"  name="company">
                    <label for="name" class="mt-10">Country</label>
                    <input type="text" v-model="register.country" placeholder="country"  name="country">
                    <label for="name" class="mt-10">State</label>
                    <input type="text" v-model="register.state" placeholder="state"  name="state">
                    <label for="name" class="mt-10">Address</label>
                    <input type="text" v-model="register.address" placeholder="address"  name="address">
                    <button type="submit" @click.prevent="customerRegistration()">create an account</button>
                </div>
            </div>
            <div class="col-md-6 sm-mt-40 xs-mt-40">
                <div class="authentication">
                    <div class="border-title">
                        <h3>already registered?</h3>
                    </div>
                    <label for="email">Email address</label>
                    <input type="email" placeholder="email address" v-model="login.email"  name="email">
                    <label for="password">Password</label>
                    <input type="password" name="password" v-model="login.password" placeholder="password" >
                    <button type="submit" @click.prevent="customerLogin()">sign in</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- authentication content end -->
@endsection