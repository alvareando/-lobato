class DishesController < ApplicationController
  before_action :set_menu
  def new
    @dish = Dish.new

    @categories = []
    Category.all.each do |category|
      @categories << category
    end


  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.menu = Menu.find(params[:menu_id])
    category_id = @dish.category.id
    @dish.category = Category.find(category_id)
    if @dish.save!
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def update
    @dish = Dish.find(params[:id])
    @dish.update(dish_params)
    redirect_to "/dashboard"
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to "/dashboard"
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
  def dish_params
    params.require(:dish).permit(:name, :description, :price, :menu_id, :photo, :category_id)
  end


end
