class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :amount
      t.integer :income_types_id
      t.date :expected_date
      t.integer :users_id

      t.timestamps
    end
  end
end
