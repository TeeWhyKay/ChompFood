class RestaurantsController < ApplicationController
  def index
    # we can combine results from location and search
    # return restaurants closest to you
    # followed by whatever restaurants that you search
    # there are going to be repeats, so we need a way to prevent adding repeats to the results
    if params[:query].present?
      # geocode_result = Geocoder.search("#{params[:query]}, Singapore") # no method ERROR if no coordindates!!
      # if geocode_result.empty?
      #   nearby_restaurants = []
      # else
      #   query_location = geocode_result.first.coordinates
      #   nearby_restaurants = Restaurant.near(query_location, 5, units: :km)
      # end
      # list of nearest restaurants
      # list of searched restaurants
      # raise

      coordinate = [request.location.latitude, request.location.longitude]
      raise
      nearby_restaurants = Restaurant.near(coordinate, 5, units: :km) ? Restaurant.near(coordinate, 5, units: :km) : Restaurant.near('Singapore', 5, units: :km)
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

  def include_searched(nearest_rest, searched_rest)
    searched_rest.each do |rest|
      nearest_rest << rest unless nearest_rest.include?(rest)
    end
    return nearest_rest
  end
end
