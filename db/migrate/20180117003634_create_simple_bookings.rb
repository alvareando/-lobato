class CreateSimpleBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_bookings do |t|
      t.time :time
      t.date :date
      t.integer :people
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :restaurant, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
