class Passenger < ApplicationRecord
  belongs_to :booking, inverse_of: :passengers

  VALID_REGEX_NAME = /[a-zA-Z]+/

  validates :passenger_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3 }

  validates :passport_number,
            presence: true
end
