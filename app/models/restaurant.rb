class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_many :bookings
  has_many :simple_bookings
  mount_uploader :photo, PhotoUploader

   def build_dashboard
    @carta = Menu.new(name:"Carta")
    @carta.restaurant = self
    @carta.save!
    @starters = Category.new(name: "Entrantes")
    @starters.menu = @carta
    @starters.save!
    @meats = Category.new(name: "Carnes")
    @meats.menu = @carta
    @meats.save!
    @fishes = Category.new(name: "Pescados")
    @fishes.menu = @carta
    @fishes.save!
    @classics = Category.new(name: "Clásicos")
    @classics.menu = @carta
    @classics.save!
    @desserts = Category.new(name: "Postres")
    @desserts.menu = @carta
    @desserts.save!
    @wines = Category.new(name: "Vinos")
    @wines.menu = @carta
    @wines.save!
  end
end
