class FlightsController < ApplicationController
  before_action :find_flight, only: [:show, :edit, :update, :destroy]

  def index
    @airports = Airport.all.order("id ASC")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def search_flights
    @params = flight_params

    @flights = Flight.select("flights.*, airlines.airline_name")
                    .joins("INNER JOIN airlines ON airlines.id = flights.airline_id")
                    .where("source_airport_id = ? and destination_airport_id = ? and available_seats >= ?", @params[:origin], @params[:destination], @params[:passenger])
                    .where("departure_date > ?", Date.parse(@params[:flight_date_submit]) - 1)
                    .where("departure_date < ? ", Date.parse(@params[:flight_date_submit]) + 1)
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  private

    def flight_params
      params.permit(:origin, :destination, :passenger, :flight_date, :flight_date_submit, :flight_group)
    end

    def find_flight
      @flight = Flight.find(params[:id])
    end
end
