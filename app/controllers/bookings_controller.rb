class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.restaurant = @restaurant
  end

  private

  def booking_params # Faltan params such as email and name
    params.require(:booking).permit(:time, :date, :people)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
