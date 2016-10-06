class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :booking_code
      t.boolean :is_deleted
      t.belongs_to :flight, foreign_key: true

      t.timestamps
    end
  end
end
