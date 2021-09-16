class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: [ :name, :address ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
