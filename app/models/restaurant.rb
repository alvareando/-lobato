class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_many :bookings
  has_many :simple_bookings
  mount_uploader :photo, PhotoUploader
end
