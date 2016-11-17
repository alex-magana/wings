class AddCostToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :cost, :decimal
  end
end
