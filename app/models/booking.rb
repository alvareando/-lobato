class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :menu
  has_and_belongs_to_many :dishes
end
