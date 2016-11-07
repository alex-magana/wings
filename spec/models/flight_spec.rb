require "rails_helper"

RSpec.describe Flight, type: :model do
  subject(:flight) { create :flight, flight_code: "RU" }

  describe "associations" do
    it { should have_many(:bookings) }
  end

  describe "check for available flights" do
    it "returns existing flights" do
      params = {
        origin: flight.source_airport_id,
        destination: flight.destination_airport_id,
        passenger: 3,
        flight_date_submit: "2016-10-22 00:00:00"
      }
      available_flights = Flight.search(params)

      expect(available_flights.first.flight_code).to eq flight.flight_code
    end
  end
end
