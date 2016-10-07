class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :new_booking_params, only: [:new]
  before_action :booking_params, only: [:confirm_booking]

  def index
    @bookings = Booking.all
    #@bookings = Booking.where("user_id = ? and is_deleted = ?", @current_user, 0)
    binding.pry
  end

  def show
  end

  def new
    @flight = Flight.find(params[:flight_group].to_i)
    @booking = Booking.new
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
    binding.pry
    render '_confirm_booking'
  end

  def search_booking
    @booking = Booking.select("bookings.*, flights.*")
                     .joins("INNER JOIN flights ON flights.id = bookings.flight_id")
                     .where("booking_code = ?", params[:booking_code])
    render '_search_results'
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
      params.require(:booking).permit(:flight_id, :booking_code, passengers_attributes: [:id, :passenger_name, :passport_number, :_destroy])
    end
end
