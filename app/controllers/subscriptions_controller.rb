class SubscriptionsController < ApplicationController
  
  def plans
    @plans = Stripe::Plan.all[:data]
  end

  # Stripe callbacks
  
  def subscription_checkout
    plan = Stripe::Plan.retrieve params[:plan_id]
    
    customer = Stripe::Customer.create(
      description: "Customer for this test app!",
      source: params[:stripeToken],
      email: "test@example.whatev"
    )
    customer.subscriptions.create(plan: plan.id)
    flash[:notice] = "Successfully created a charge"
    redirect_to '/plans'
  end
end
