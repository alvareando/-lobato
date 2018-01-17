class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant

  def new
    @menus = @restaurant.menus
    @menus.each do |menu|
      @menu = menu
    end

    @dishes = @menu.dishes
    @booking = Booking.new
  end

  def create
    @menus = @restaurant.menus
    @menus.each do |menu|
      @menu = menu
    end
    @dishes = @menu.dishes
    @booking = Booking.new(booking_params)
    @booking.restaurant = @restaurant
    @booking.menu = @menu
    if @booking.save
      new_booking_participation = BookingParticipation.new
      new_booking_participation.booking = @booking
      new_booking_participation.user = @restaurant.user
      new_booking_participation.save!
      redirect_to root_path, notice: "Gracias por reservar en el #{@booking.restaurant.name}"
    else
      render :new, alert: "Lo sentimos, algo ha ido mal!"
    end
  end

  private

  def booking_params # Faltan params such as email and name
    params.require(:booking).permit(:name, :last_name, :phone, :email, :time, :date, :people)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
