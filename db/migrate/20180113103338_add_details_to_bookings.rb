class AddDetailsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :phone, :string
  end
end
