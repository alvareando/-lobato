class SimpleBooking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :name, presence: true
  validates :last_name, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :people, presence: true
end
