class AddForeignKeyToFlights < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :flights, :airlines, column: :airline_id, primary_key: "id"
  end
end
