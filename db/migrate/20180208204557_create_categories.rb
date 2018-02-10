class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :name, :string
    remove_column :categories, :category, :string
    end
end
