class RemoveDestinationAirportFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :destination_airport
  end
end
