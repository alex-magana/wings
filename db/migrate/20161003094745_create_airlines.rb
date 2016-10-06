class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.string :airline_name
      t.string :airline_alias
      t.string :iata_code
      t.string :icao_code
      t.string :call_sign
      t.string :country
      t.boolean :active
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
