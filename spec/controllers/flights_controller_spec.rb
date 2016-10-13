require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    it 'assigns airport records to airports' do
      create(:airport)
      expect(assigns(:airports)).to eq Airport.airports_all
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe '#search_flights' do
    # before(:each) { get :search_flights }
    # it { should permit(:flight_params).for(:search_flights) }
    # it 'assigns flight record to flights' do
      # airline = create(:airline)
      # flight = create(:flight, airline_id: airline.id)
      # params = flight_params
      # expect(assigns(:flights)).to eq Flight.flights_available(params)
    # end
    # it 'returns a status code of 200' do
      # get :search_flights
      # expect(response.status).to eq 200
    # end
    # it 'renders the search_flights template' do
      # get :search_flights
      # expect(response).to render_template('search_flights')
    # end
  end

  private

    def flight_params
      params.permit(:origin, :destination, :passenger, :flight_date, :flight_date_submit, :flight_group)
    end
end
