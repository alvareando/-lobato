class AddPhotoToDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :category
    end
    add_reference :dishes, :category, foreign_key: true
  end
end
