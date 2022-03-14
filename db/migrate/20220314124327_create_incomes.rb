class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.string :amount
      t.string :income_type
      t.string :expected_date
      t.integer :users_id

      t.timestamps
    end
  end
end
