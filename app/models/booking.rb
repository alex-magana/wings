class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true

  VALID_REGEX_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :booking_code,
            presence: true

  validates :flight_id,
            presence: true

  validates :user_id,
            presence: true

  validates :email,
            presence: true,
            format: { with: VALID_REGEX_EMAIL }
end
