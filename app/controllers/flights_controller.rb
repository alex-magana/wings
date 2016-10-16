class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @airports = Airport.airports_all
  end
  def search_flights
    @flights = Flight.search_flights(flight_params)
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  private
    def flight_params
      params.permit(:utf8, :button, :format, :origin, :destination, :passenger, :flight_date, :flight_date_submit, :flight_group)
    end
    def set_flight
      @flight = Flight.find(params[:id])
    end
end
