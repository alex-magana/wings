class Flight < ApplicationRecord
  has_many :bookings, inverse_of: :flight
  accepts_nested_attributes_for :bookings, reject_if: :all_blank, allow_destroy: true
end
