require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  describe "#index" do
    before(:each) { get :index }

    it "assigns airport records to airports" do
      create(:airport)
      expect(assigns(:airports)).to eq Airport.airports_all
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "#search_flights" do
    let(:airline) { create :airline }

    subject(:flight) { create :flight, airline_id: airline.id }

    before(:each) do
      get :search_flights, params: { origin: flight.source_airport_id,
                                     destination: flight.destination_airport_id,
                                     passenger: flight.available_seats,
                                     flight_date_submit:
                                       flight.departure_date }, format: :js
    end

    it "assigns flight record to flights" do
      expect(assigns(:flights).first[:id]).to eq flight.id
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the search_flights template" do
      expect(response).to render_template("search_flights")
    end
  end
end
