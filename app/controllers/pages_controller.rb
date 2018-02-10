class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @restaurant = current_user.restaurant
    @carta = current_user.restaurant.menus.first
    @dishes = @carta.dishes
    @categories = @carta.categories
    @menus = @restaurant.menus
    @user = current_user
    @simple_bookings = @restaurant.simple_bookings

  # Dish Categories
    @starters = @carta.dish_category("starters")
    @meats = @carta.dish_category("meats")
    @fishes = @carta.dish_category("fishes")
    @classics = @carta.dish_category("classics")
    @desserts = @carta.dish_category("desserts")
    @wines = @carta.dish_category("wines")

  # Bookings Categories
    @ongoing_bookings = current_user.user_bookings('ongoing')
    @over_bookings = current_user.user_bookings('over')

  end
end
