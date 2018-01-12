class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.time :time
      t.date :date
      t.integer :people
      t.references :restaurant, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
