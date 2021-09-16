class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @restaurants = Restaurant.where(promo_status: 1).last(5)
  end
end
