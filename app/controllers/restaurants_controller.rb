class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @foods = @restaurant.foods
  end
end
