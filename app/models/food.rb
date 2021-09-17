class Food < ApplicationRecord
  monetize :price_cents
  belongs_to :restaurant
  has_many :food_orders
  has_many :orders, through: :food_orders
  validates :name, :price, :description, :photo_url, presence: true
end
