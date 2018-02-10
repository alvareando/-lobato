class Dish < ApplicationRecord
  belongs_to :menu
  has_and_belongs_to_many :bookings
  belongs_to :category
  mount_uploader :photo, PhotoUploader
  CATEGORIES = %w[Entrantes Carnes Caza Pescados Clásicos Postres Vinos]


end
