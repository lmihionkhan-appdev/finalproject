class AddUserToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :users_id, :integer
  end
end
