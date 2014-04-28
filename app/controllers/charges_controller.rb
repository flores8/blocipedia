class ChargesController < ApplicationController

	def new
		@stripe_btn_hash = {
			src: "https://checkout.stripe.com/checkout.js",
			class: 'stripe-button',
			data: {
				key: "#{ Rails.configuration.stripe[:publishable_key] }",
				description: "Premium Wiki ($12)", 
				amount: 12_00 # This is $12.  2_000_00 is $2,000, 500_000_000_00 is $500,000,000
			}
		}
	end

	def create
		@amount = params[:amount]

		# Create a Stripe Customer object, for associating with the charge
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
			)

		# Create a charge!
		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: @amount,
			description: "Premium Wikis",
			currency: 'usd'
			)
		flash[:success] = "Congratulations, you now have access to preium wikis"
		redirect_to root_path

		# Stripe will send back CardErrors, with friendly messages when something goes wrong.
		# This rescue block catches and displays those errors.
	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to root_path
	end

end
