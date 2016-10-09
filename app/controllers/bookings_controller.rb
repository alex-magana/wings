class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :new_booking_params, only: [:new]
  before_action :booking_params, only: [:confirm_booking]

  def index
    @bookings = Booking.all
    binding.pry
    #@bookings = Booking.where("user_id = ? and is_deleted = ?", @current_user, 0)
  end

  def show
  end

  def new
    @flight = Flight.find(params[:flight_group].to_i)
    @booking = Booking.new
    @booking.user_id = 2
    binding.pry
    @booking.flight = @flight
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  def confirm_booking
    @booking = params
    render '_confirm_booking'
  end

  def search_booking
    @bookings = Booking.select("bookings.*, flights.flight_code, flights.airline_code, flights.departure_date, flights.arrival_date")
                       .joins("INNER JOIN flights ON flights.id = bookings.flight_id")
                       .where("bookings.booking_code = ?", params[:booking_code])
    render '_search_results'
  end

  def past_bookings
    @bookings = Booking.select("bookings.*, flights.flight_code, flights.airline_code, flights.departure_date, flights.arrival_date")
                       .joins("INNER JOIN flights ON flights.id = bookings.flight_id")
                       .where("bookings.user_id = ?", 2) # params[:user_id]
    render '_past_bookings'
  end

  def manage_bookings
    render '_search_booking'
  end

  private

    def new_booking_params
      params.require(:flight_group)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_id, :flight_id, :booking_code, passengers_attributes: [:id, :passenger_name, :passport_number, :_destroy])
    end
end
