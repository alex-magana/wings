class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @airports = Airport.airports_all
  end

  def search_flights
    @flights = Flight.search(flight_params)
    flash[:notice] = "There are no available flights." if @flights.empty?
    respond_to do |format|
      format.js do
        render layout: false, locals: { passengers_qty:
                                          flight_params[:passenger] }
      end
    end
  end

  private

  def flight_params
    params.permit(:origin, :destination, :passenger,
                  :flight_date, :flight_date_submit, :flight_group)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
