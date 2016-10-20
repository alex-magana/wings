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

  scope :past_bookings, -> (params) do
    joins("INNER JOIN flights ON flights.id = bookings.flight_id")
    .where("bookings.user_id = ?", params.id)
    .select("bookings.*, flights.flight_code, flights.airline_code,\
     flights.departure_date, flights.arrival_date")
  end

  scope :search_booking_write, -> (params) do
    where("bookings.booking_code = ?", params[:booking_code])
  end

  scope :search_booking_read, -> (params) do
    joins("INNER JOIN flights ON flights.id = bookings.flight_id")
    .where("bookings.booking_code = ?", params[:booking_code])
    .select("bookings.*, flights.flight_code, flights.airline_code,\
     flights.departure_date, flights.arrival_date")
  end
end
