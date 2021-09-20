class FoodOrdersController < ApplicationController
  # create a new for making new food orders (may be in restaurant controller)
  # create a create for adding into food orders

  def index
  end

  def show
  end

  def cart_info
    total = 0

    order_params.each do |item|
      food = Food.find(item["dishId"])
      total += food.price.fractional.fdiv(100) * item["quantity"].to_i
      item.merge!({ dishPrice: food.price, dishName: food.name })
    end

    respond_to do |format|
      format.json { render json: { items: order_params, total: total } }
    end
  end

  private

  def order_params
    params.permit!["_json"]
  end
end
