desc "Hydrate the database with some sample data to look at so that developing is easier"

task({ :sample_data => :environment }) do
  #a_user = User.new
  #a_user.email = "example#{rand(1000)}@example.com"
  #a_user.password = "password"
  #a_user.save

  #p a_user.errors.full_messages

  #add incomes

  #20.times do
  #i_new = Income.new
  #i_new.users_id = a_user.id
  #i_new.amount = rand(20000).to_f
  #i_new.expected_date = Date.today.advance(days: rand(-30..200))
  #i_new.name = "income #" + rand(20).to_s
  #i_new.income_types_id = rand(5)

  #i_new.save
  #end

  #p i_new.errors.full_messages

  #add expenses

  #20.times do
  # e_new = Expense.new
  #e_new.users_id = a_user.id
  #e_new.amount = rand(20000).to_f
  #e_new.expected_date = Date.today.advance(days: rand(-30..200))
  #e_new.name = "expense #" + rand(20).to_s
  #e_new.expense_types_id = [2, 3].sample
  #e_new.trips_id = nil
  #e_new.save
  #end

  #p e_new.errors.full_messages
end
