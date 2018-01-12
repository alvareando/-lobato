class AddMenuReferencesToDish < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :menu, add_foreign_key: :true
  end
end
