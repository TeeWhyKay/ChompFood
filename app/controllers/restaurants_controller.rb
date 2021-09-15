class RestaurantsController < ApplicationController
  def index
    if params[:query].present?
      @restaurants = Restaurant.where(name: params[:query])
    else
      @restaurants = Restaurant.all
    end
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
