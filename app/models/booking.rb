class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  has_many :passengers, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :passengers,
                                reject_if: :all_blank, allow_destroy: true

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

  validates :cost,
            presence: true

  before_validation :generate_booking_code, :compute_cost, on: :create
  before_create :generate_booking_code, :compute_cost

  def self.find_by_user(user)
    Booking.where(user_id: user.id)
  end

  def self.find_by_booking_code(code)
    Booking.where(booking_code: code)
  end

  private

  def generate_booking_code
    self.booking_code = SecureRandom.hex(4).upcase
  end

  def compute_cost
    self.cost = flight.cost * passengers.size
  end
end
