class PaymentsController < ApplicationController
  def create
    order = Order.last

    total_sum = 0

    order.details.each do |ord|
      foodorder = FoodOrder.new
      foodorder.order = Order.last
      foodorder.food = Food.find(ord["dishId"].to_i)
      foodorder.quantity = ord["quantity"].to_i
      foodorder.save!
      rest = Food.find(ord["dishId"].to_i).restaurant
      if rest.promo_status == 1
        total_sum += (Food.find(ord["dishId"].to_i).price_cents * 0.8).round * ord["quantity"].to_i
      else
        total_sum += Food.find(ord["dishId"].to_i).price_cents * ord["quantity"].to_i
      end
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "#{Order.last.details[0]['restaurant']} - #{current_user.email}",
        amount: total_sum,
        currency: 'sgd',
        quantity: 1
      }],
      mode: 'payment',
      success_url: order_success_url,
      cancel_url: cart_url
    )
    order.update(checkout_session_id: session.id)
    redirect_to session.url
  end
end
