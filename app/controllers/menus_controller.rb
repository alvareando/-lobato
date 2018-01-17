class MenusController < ApplicationController
before_action :set_restaurant
  def new
    @menu = Menu.new
  end

  def create
    new_menu = Menu.new(menu_params)
    new_menu.restaurant = @restaurant
    if new_menu.save
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def menu_params
    params.require(:menu).permit(:name, :menu_price)
  end
end
