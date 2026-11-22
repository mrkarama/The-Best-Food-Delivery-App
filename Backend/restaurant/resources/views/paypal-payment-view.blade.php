<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>

        <title>Paypal Payment</title>

        <style>
            .payment_options{
                font-size: 70px;
            }
        </style>

    </head>
    <body>
        <center>
            <h2 class="payment_options">
            Payment Options
            </h2>

            <form method="post" action="{{ route('paypal') }}">
            
            @csrf
            <input type="hidden" name="price">
            <button type="submit">
                <img width="200" height="100" src="{{asset('storage/assets/admin/img/paypal.png')}}">
            </button><br><br><br>
<!-- 
            <form method="post" action="{{route('stripe')}}">

            @csrf
            <button>
                <img width="200" height="100" src="{{asset('storage/assets/admin/img/stripe.png')}}">
            </button> -->
        </center>
    </body>
</html>
