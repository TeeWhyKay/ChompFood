class FoodOrder < ApplicationRecord
  belongs_to :food
  belongs_to :order
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
