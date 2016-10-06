class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :passenger_name
      t.string :passport_number
      t.belongs_to :booking, foreign_key: true

      t.timestamps
    end
  end
end
