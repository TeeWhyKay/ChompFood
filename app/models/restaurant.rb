class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :name, presence: true
  attribute :promo_status, :integer, default: 0

  geocoded_by :address,
              latitude: :fetched_latitude,
              longitude: :fetched_longitude
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, unless: ->(obj){ obj.address.present? and obj.latitude.present? and obj.longitude.present? }
  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: [ :name, :address ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
