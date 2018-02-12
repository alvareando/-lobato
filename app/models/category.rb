class Category < ApplicationRecord
  has_many :dishes
  belongs_to :menu, dependent: :destroy
end

