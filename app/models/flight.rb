class Flight < ApplicationRecord
  has_many :bookings, inverse_of: :flight
  accepts_nested_attributes_for :bookings, reject_if: :all_blank, allow_destroy: true

  scope :search_flights, -> (params) do
    joins("INNER JOIN airlines ON airlines.id = flights.airline_id")
    .where("source_airport_id = ? and destination_airport_id = ? and available_seats >= ?", params[:origin], params[:destination], params[:passenger])
    .where("departure_date > ?", Date.parse(params[:flight_date_submit]) - 1)
    .where("departure_date < ? ", Date.parse(params[:flight_date_submit]) + 1)
    .select("flights.*, airlines.airline_name")
  end
end
