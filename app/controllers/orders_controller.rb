class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    # teddy = Teddy.find(params[:teddy_id])
    # order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "testing",
        amount: "500",
        currency: 'sgd',
        quantity: 1
      }],
      mode: 'payment',
      success_url: orders_url(root_path),
      cancel_url: cart_url(root_path)
    )
    redirect_to session.url
  end
end
