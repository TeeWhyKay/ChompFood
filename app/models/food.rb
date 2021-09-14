class Food < ApplicationRecord
  validates :name, :price, :description, :photo_url, presence: true
end
