class WingsMailer < ApplicationMailer
  def send_email(email)
    binding.pry
    mail(to: email, subject: 'Sample Email')
  end
end
