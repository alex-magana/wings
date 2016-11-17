class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  belongs_to :user
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

  validate :must_have_at_least_one_passenger, on: :create

  before_validation :generate_booking_code, :compute_cost, on: :create
  before_create :generate_booking_code, :compute_cost

  def self.search_by_booking_code(code)
    Booking.find_by(booking_code: code)
  end

  private

  def must_have_at_least_one_passenger
    if passengers_empty?
      errors.add(:passengers, "Must have at least one passenger")
    end
  end

  def passengers_empty?
    passengers.empty? || passengers.all? do |passenger|
      passenger.marked_for_destruction?
    end
  end

  def generate_booking_code
    self.booking_code = SecureRandom.hex(4).upcase
  end

  def compute_cost
    self.cost = flight.cost * passengers.size
  end
end
