class AddForeignKeysandFloat < ActiveRecord::Migration[6.0]
  def change
    change_table :incomes do |t|
      t.remove :amount
      t.rename :income_type, :income_types_id
      t.integer :income_types_id
      t.add :amount, :float
    end

    change_table :expenses do |t|
      t.remove :amount
      t.rename :expense_type, :expense_types_id
      t.integer :expense_types_id
      t.add :amount, :float
    end

    #create_table :trips do |t|
    #t.string :name
    #t.date :expected_date

    #t.timestamps
    #end

    #create_table :expense_types do |t|
    #t.string :name

    #t.timestamps
    #end

    #create_table :income_types do |t|
    #t.string :name

    #t.timestamps
    #end

    #add_column :expenses, :trips_id
    #add_column :incomes, :amount, :float
    #add_column :expenses, :amount, :float
  end
end
