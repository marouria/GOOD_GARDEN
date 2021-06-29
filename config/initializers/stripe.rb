    Rails.configuration.stripe = {
:publishable_key => ENV["pk_test_TYooMQauvdEDq54NiTphI7jx"],
:secret_key      => ENV["sk_test_4eC39HqLyjWDarjtT1zdp7dc"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
