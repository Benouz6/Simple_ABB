class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
  against: [ :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
