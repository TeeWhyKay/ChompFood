class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # there are might be repeats, so we need a way to prevent adding repeats to the results
    location = params[:location]
    coordinates = retrieve_coordinates(location)

    if params[:query].present?
      nearby_restaurants = Restaurant.near(coordinates, 5, :order => :distance) ? Restaurant.near(coordinates, 5, :order => :distance) : Restaurant.near('Singapore', 10, :order => :distance)
      @restaurants = Restaurant.search_by_name_and_address(params[:query]) + nearby_restaurants
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @foods = @restaurant.foods
  end

  private

  def retrieve_coordinates(location)
    if Rails.env.production?
      if location == 'none' # user did not choose to reveal location
        return [request.location.latitude, request.location.longitude]
      else
        return location.split(',')
      end
    else
      return [1.2897, 103.8501]
    end
  end
end
