class Flight < ApplicationRecord
  has_many :bookings, inverse_of: :flight
  belongs_to :airline
  belongs_to :source_airport,
             class_name: "Airport",
             foreign_key: "source_airport_id"
  belongs_to :destination_airport,
             class_name: "Airport",
             foreign_key: "destination_airport_id"

  accepts_nested_attributes_for :bookings,
                                reject_if: :all_blank, allow_destroy: true

  def self.search(params)
    joins(:source_airport, :destination_airport).
      where(airports: { id: 1 }, destination_airports_flights: { id: 2 }).
      where("available_seats >= ? AND departure_date > ?"\
            " AND departure_date < ?",
            params[:passenger], (Date.parse(params[:flight_date_submit]) - 1),
            (Date.parse(params[:flight_date_submit]) + 1))
  end
end
