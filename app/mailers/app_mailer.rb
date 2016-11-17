class AppMailer < ApplicationMailer
  def message_send(booking)
    @booking = booking
    @url = "https://flightset.herokuapp.com/"
    mail(to: @booking.email, subject: "Flightset. For the globetrotter")
  end
  def password_send(user)
    @user = user
    @url = "https://flightset.herokuapp.com/"
    mail(to: @user.email, subject: "Flightset. For the globetrotter")
  end
end
