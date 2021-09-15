class Restaurant < ApplicationRecord
  has_many :foods
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
