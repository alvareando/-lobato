class SimpleBookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant

  def new
    @simple_booking = SimpleBooking.new
  end

  def create
    new_simple_booking = SimpleBooking.new(simple_booking_params)
    new_simple_booking.user = @restaurant.user
    new_simple_booking.restaurant = @restaurant

    if new_simple_booking.save
      SimpleBookingMailer.restaurant_new_booking(new_simple_booking.user, new_simple_booking).deliver_now
      SimpleBookingMailer.client_booking_details(new_simple_booking).deliver_now
      redirect_to restaurant_simple_booking_path(@restaurant, new_simple_booking), notice: "Gracias por reservar en el #{new_simple_booking.restaurant.name}"

    else
      render :new, alert: "Lo sentimos, algo ha ido mal!"
    end
  end

  def show

    @simple_booking = @restaurant.simple_bookings.find(params[:id])
    @simple_booking.restaurant = @restaurant
    @simple_booking.user = @user
  end

  private

  def simple_booking_params
    params.require(:simple_booking).permit(:name, :last_name, :email, :phone, :time, :date, :people)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
