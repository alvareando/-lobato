class Dish < ApplicationRecord
  belongs_to :menu
  CATEGORIES = %w[Entrantes Carnes Caza Pescados Clásicos Postres Vinos]
end
