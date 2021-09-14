class Restaurant < ApplicationRecord
  has_many :foods
  validates :name, presence: true
end
