require "rails_helper"

RSpec.describe Flight, type: :model do
  subject(:flight) { create :flight, flight_code: "RU" }

  describe "associations" do
    it { is_expected.to have_many(:bookings) }
    it { is_expected.to belong_to(:airline) }
    it { is_expected.to belong_to(:source_airport) }
    it { is_expected.to belong_to(:destination_airport) }
    it { is_expected.to accept_nested_attributes_for(:bookings) }
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
