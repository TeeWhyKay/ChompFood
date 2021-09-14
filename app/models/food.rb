class Food < ApplicationRecord
  belongs_to :restaurant
  validates :name, :price, :description, :photo_url, presence: true
end
