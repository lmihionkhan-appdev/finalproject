desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  a_user = User.new
  a_user.email = "example@example.com"
  a_user.password = "password"
  a_user.save

  #add incomes

  20.times do
    i = Income.new
    i.users_id = a_user.id
    i.amount = rand(20000).to_f
    i.expected_date = rand(1.years).from_now
    i.name = "income #" + rand(20)
    i.income_types_id = rand(5)
    i.save
  end

  #add expenses

  20.times do
    e = Expenses.new
    e.users_id = a_user.id
    e.amount = rand(20000).to_f
    e.expected_date = rand(1.years).from_now
    e.name = "expense #" + rand(20)
    e.expense_types_id = [2, 3].sample
    e.save
  end
end
