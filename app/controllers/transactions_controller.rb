class TransactionsController < ApplicationController
  def new
  end

  def create
    @amount = 500 # cents
    customer = Stripe::Customer.create customer_params
    
    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Rails Stripe customer",
      currency: "usd"
    )
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_transaction_path
  end
  
  private
  
  def customer_params
    params.permit(:stripe_email, :source)
  end
end
