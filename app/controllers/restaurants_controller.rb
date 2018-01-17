class RestaurantsController < ApplicationController
  def new
    @user = current_user
    @restaurant = Restaurant.new
  end

  def create
    new_restaurant = Restaurant.new(restaurant_params)
    new_restaurant.user = current_user
    if new_restaurant.save
      redirect_to "/dashboard"
    else
      render :new
    end
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :photo)
  end
end
