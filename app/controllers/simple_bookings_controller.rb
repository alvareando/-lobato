class SimpleBookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant

  def new
    @simple_booking = SimpleBooking.new
  end

  def create
    @simple_booking = SimpleBooking.new(simple_booking_params)
    @simple_booking.user = @restaurant.user
    @simple_booking.restaurant = @restaurant
    if @simple_booking.save!
      redirect_to root_path, notice: "Gracias por reservar en el #{@simple_booking.restaurant.name}"
    else
      render :new, alert: "Lo sentimos, algo ha ido mal!"
    end
  end

  private

  def simple_booking_params
    params.require(:simple_booking).permit(:name, :last_name, :phone, :time, :date, :people)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
