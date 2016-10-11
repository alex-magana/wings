class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :new_booking_params, only: [:new]
  before_action :booking_params, only: [:confirm_booking, :create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @flight = Flight.find(params[:flight_group].to_i)
    @booking = Booking.new
    @booking.user_id = current_user
    @booking.flight = @flight
    @booking.booking_code = SecureRandom.hex(4).upcase
    if current_user
      @booking.email = current_user.email
    end
    if current_user
      @booking.user_id = current_user.id
    else
      @booking.user_id = 2
    end
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
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_booking
    @booking = Booking.new(booking_params)
  end

  def past_bookings
    @bookings = Booking.select("bookings.*, flights.flight_code, flights.airline_code, flights.departure_date, flights.arrival_date")
                       .joins("INNER JOIN flights ON flights.id = bookings.flight_id")
                       .where("bookings.user_id = ?", current_user)
    render '_past_bookings'
  end

  def manage_bookings
    render '_search_booking'
  end

  def search_booking
    if current_user
      @booking = Booking.where("bookings.booking_code = ?", params[:booking_code]).first
      render 'edit'
    else
      @booking = Booking.select("bookings.*, flights.flight_code, flights.airline_code, flights.departure_date, flights.arrival_date")
                         .joins("INNER JOIN flights ON flights.id = bookings.flight_id")
                         .where("bookings.booking_code = ?", params[:booking_code])
      render '_search_results'
    end
  end

  private

    def new_booking_params
      params.require(:flight_group)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :flight_id, :booking_code, :email, passengers_attributes: [:id, :passenger_name, :passport_number, :_destroy])
    end
end
