class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :price
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
