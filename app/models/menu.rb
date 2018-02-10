class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes
  has_many :bookings
  has_many :categories

  def dish_category(category = nil)
    case category
    when "starters"
      Dish.where("dish.category == Entrante")
    when "meats"
      Dish.where("dish.category == Carnes")
    when "fishes"
      Dish.where("dish.category == Pescados")
    when "classics"
      Dish.where("dish.category == Clásicos")
    when "desserts"
      Dish.where("dish.category == Postres")
    when "wines"
      Dish.where("dish.category == Vinos")
    else
      Dish.where(self)
    end
  end
end
