class Flight < ApplicationRecord
  has_many :bookings, inverse_of: :flight
  belongs_to :airline

  accepts_nested_attributes_for :bookings,
                                reject_if: :all_blank, allow_destroy: true

  def self.search(params)
    Flight.where("source_airport_id = ? AND destination_airport_id = ? AND "\
                 "available_seats >= ? AND departure_date > ? AND "\
                 "departure_date < ?", params[:origin], params[:destination],
                 params[:passenger],
                 (Date.parse(params[:flight_date_submit]) - 1),
                 (Date.parse(params[:flight_date_submit]) + 1))
  end
end
