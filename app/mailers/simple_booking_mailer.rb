class SimpleBookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def restaurant_new_booking(user, simple_booking)
    @user = user
    @simple_booking = simple_booking

    mail to: @user.email, subject: 'Tienes una nueva reserva'
  end

  def client_booking_details(simple_booking)
    @simple_booking = simple_booking
    mail to: simple_booking.email, subject: 'Los detalles de su reserva'
  end


end
