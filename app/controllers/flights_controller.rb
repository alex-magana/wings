class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @airports = Airport.all.order("id ASC")
  end

  def search_flights
    @flights = Flight.search(flight_params)
    flash.now[:notice] = Messages.flights_not_available if @flights.empty?
    respond_to do |format|
      format.js do
        render(
          layout: false,
          locals: { passengers_qty: flight_params[:passenger] }
        )
      end
    end
  end

  private

  def flight_params
    params.permit(
      :origin,
      :destination,
      :passenger,
      :flight_date,
      :flight_date_submit,
      :flight_id
    )
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
