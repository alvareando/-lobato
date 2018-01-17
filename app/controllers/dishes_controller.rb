class DishesController < ApplicationController
  before_action :set_menu
  def new
    @dish = Dish.new

  end

  def create

    @dish = Dish.new(dish_params)
    @dish.menu = Menu.find(params[:menu_id])
    if @dish.save!
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
  def dish_params
    params.require(:dish).permit(:name, :description, :price, :menu_id, :photo)
  end


end
