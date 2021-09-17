class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @restaurants = Restaurant.where(promo_status: 1).last(5)

    @restaurant_pages = []
    @restaurants.each_slice(4) do |arr|
      @restaurant_pages << arr
    end
  end
end
