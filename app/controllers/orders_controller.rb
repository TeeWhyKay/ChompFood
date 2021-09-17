class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    order = Order.new(details: order_params)
    order.status = 'pending'
    order.user = current_user

    if order.save
      respond_to do |format|
        format.json { render json: { status: 'order_created', order_id: order.id } }
      end
    end
  end

  private

  def order_params
    params.permit!['_json']
  end
end
