class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :name, presence: true
  attribute :promo_status, :integer, default: 0

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
