class Dish < ApplicationRecord
  belongs_to :menu
  belongs_to :category
  mount_uploader :photo, PhotoUploader
  CATEGORIES = %w[Entrantes Carnes Caza Pescados Clásicos Postres Vinos]


end
