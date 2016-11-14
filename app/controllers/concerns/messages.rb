class Messages
  def self.login_required
    "LOG IN REQUIRED"
  end

  def self.invalid_login_credentials
    "Invalid username or password."
  end

  def self.email_not_available
    "Email does not exist."
  end

  def self.password_reset_successful
    "Password reset successfully. Please check your email."
  end

  def self.password_reset_unsuccessful
    "Unable to reset password. Try again later."
  end

  def self.flights_not_available
    "There are no available flights."
  end

  def self.booking_creation_successful
    "Booking was successfully created."
  end

  def self.booking_update_successful
    "Booking was successfully updated."
  end

  def self.booking_destroyed_successful
    "Booking was successfully destroyed."
  end

  def self.past_bookings_not_available
    "There are no past bookings."
  end

  def self.reservation_not_available
    "No reservations available."
  end
end
