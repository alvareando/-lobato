class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @restaurant = current_user.restaurant
    @menus = @restaurant.menus
    @user = current_user
  end
end
