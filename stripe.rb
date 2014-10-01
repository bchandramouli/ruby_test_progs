#!/usr/bin/ruby

require "stripe"
Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"

Stripe::Charge.create(
  :amount => 400,
  :currency => "usd",
  :card => {
    :number => "4242424242424242",
    :exp_month => 9,
    :exp_year => 2015,
    :cvc => "314"
  },
  :description => "Charge for test@example.com"
)