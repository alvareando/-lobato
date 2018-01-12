class CreateBookingParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_participations do |t|
      t.references :booking, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
