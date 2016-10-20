class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end
  def show
  end
  def new
    @flight = Flight.find(new_booking_params[:flight_group].to_i)
    @booking = Booking.new
    @booking.flight = @flight
    @booking.booking_code = SecureRandom.hex(4).upcase
    if current_user
      @booking.email = current_user.email
      @booking.user_id = current_user.id
    else
      @booking.user_id = 2
    end
  end
  def edit
  end
  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(booking_params[:flight_id])
    @flight.available_seats = @flight.available_seats - @booking.passengers.size
    respond_to do |format|
      if @booking.save
        if @flight.save
          # Tell the AppMailer to send an email after save
          AppMailer.message_send(@booking).deliver_now
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        # Tell the AppMailer to send an email after update
        AppMailer.message_send(@booking).deliver_now
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
    @bookings = Booking.past_bookings(current_user)
    if @booking.nil? == false
      render '_past_bookings'
    else
      flash[:notice] = "There are no past bookings."
      render '_past_bookings'
    end
  end
  def manage_bookings
    render '_search_booking'
  end
  def search_booking
    if current_user
      @booking = Booking.search_booking_write(search_booking_params).first
      if @booking.nil? == false
        render 'edit'
      else
        flash[:notice] = "No reservations available."
        redirect_to manage_bookings_path
      end
    else
      @booking = Booking.search_booking_read(search_booking_params).first
      if @booking.nil? == false
        render '_search_results'
      else
        flash[:notice] = "No reservations available."
        redirect_to manage_bookings_path
      end
    end
  end
  private
    def new_booking_params
      params.permit(:flight_group)
    end
    def booking_params
      params.require(:booking).permit(:user_id, :flight_id, :booking_code, :email, passengers_attributes: [:id, :passenger_name, :passport_number, :_destroy])
    end
    def search_booking_params
      params.permit(:booking_code)
    end
    def set_booking
      @booking = Booking.find(params[:id])
    end
end
