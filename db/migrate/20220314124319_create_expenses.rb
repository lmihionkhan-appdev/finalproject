class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.date :expected_date
      t.integer :expense_types_id
      t.integer :users_id
      t.integer :trips_id

      t.timestamps
    end
  end
end
