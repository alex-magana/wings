class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.string :airport_name
      t.string :city
      t.string :country
      t.string :iata_faa_code
      t.string :icao_code
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :altitude
      t.string :timezone
      t.string :dst
      t.string :tz_database_timezone
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
