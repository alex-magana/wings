class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]

  def index
    @bookings = Booking.find_by_user(current_user)
    if @bookings.blank? || @bookings.nil?
      flash.now[:notice] = "There are no past bookings."
    end
  end

  def show
  end

  def new
    flight = Flight.find(new_booking_params[:flight_group].to_i)
    @booking = flight.bookings.new
    new_booking_params[:passengers_qty].to_i.times { @booking.passengers.build }
    @booking.email = current_user.email if current_user
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(booking_params[:flight_id])
    @flight.available_seats = @flight.available_seats - @booking.passengers.size
    if @booking.save && @flight.save
      AppMailer.message_send(@booking).deliver_now
      redirect_to @booking, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      AppMailer.message_send(@booking).deliver_now
      redirect_to @booking, notice: "Booking was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice:
                                    "Booking was successfully destroyed."
  end

  def confirm_booking
    @booking = Booking.new(booking_params)
  end

  def manage_bookings
    render "_search_booking"
  end

  def search_booking
    @booking = Booking.find_by_booking_code(search_params[:booking_code])
    if @booking.blank? == false && @booking.nil? == false
      render_search_booking_result(@booking.first, current_user)
    else
      flash[:notice] = "No reservations available."
      redirect_to manage_bookings_path
    end
  end

  def render_search_booking_result(booking, user)
    if user
      redirect_to edit_booking_path(booking)
    else
      redirect_to booking
    end
  end

  private

  def new_booking_params
    params.permit(:passengers_qty, :flight_group)
  end

  def booking_params
    params.require(:booking).permit(:user_id, :flight_id, :email,
                                    passengers_attributes:
                                    [:id, :passenger_name,
                                     :passport_number, :_destroy])
  end

  def search_params
    params.permit(:booking_code)
  end

  def set_user
    params[:booking][:user_id] = current_user_id || User.get_walk_in.id
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
