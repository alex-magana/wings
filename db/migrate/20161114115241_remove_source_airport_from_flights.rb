class RemoveSourceAirportFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :source_airport
  end
end
