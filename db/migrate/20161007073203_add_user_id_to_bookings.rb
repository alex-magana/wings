class AddUserIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :user_id, :integer
    add_foreign_key :bookings, :users, column: :user_id, primary_key: "id"
  end
end
