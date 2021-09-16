class RestaurantsController < ApplicationController
  def index
    # latlong = results.first.coordinates => [48.856614, 2.3522219]  # latitude and longitude
    # @restaurants = Restaurant.near(latlong, 5, units: :km) # venues within 5 km of a point
    if params[:query].present?
      query_location = Geocoder.search(params[:query]).first.coordinates
      if query_location.nil?
        @restaurants = Restaurant.where("name ILIKE ?", "%#{params[:query]}%")
      else

      end
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @foods = @restaurant.foods
  end
end
