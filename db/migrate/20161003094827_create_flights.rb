class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :flight_code
      t.integer :airline_id
      t.string :airline_code
      t.integer :source_airport_id
      t.string :source_airport
      t.integer :destination_airport_id
      t.string :destination_airport
      t.integer :gate_id
      t.datetime :departure_date
      t.datetime :arrival_date
      t.decimal :cost
      t.integer :capacity
      t.integer :available_seats
      t.string :codeshare
      t.integer :stops
      t.string :equipment
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
