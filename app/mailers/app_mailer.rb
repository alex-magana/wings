class AppMailer < ApplicationMailer
  def message_send(booking)
    @booking = booking
    @url = "http://flightset.com/"
    mail(to: @booking.email, subject: "Flightset. For the globetrotter")
  end
end
