class Order < ApplicationRecord
  has_many :food_orders
  has_many :foods, through: :food_orders
  belongs_to :user
end
