class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :amount
      t.date :expected_date
      t.string :expense_type
      t.integer :users_id

      t.timestamps
    end
  end
end
