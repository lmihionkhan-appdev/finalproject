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
    i.expected_date = Date.today.advance(days: rand(-30..200))
    i.name = "income #" + rand(20).to_s
    i.income_types_id = rand(5)
    i.save
  end

  #add expenses

  20.times do
    e = Expense.new
    e.users_id = a_user.id
    e.amount = rand(20000).to_f
    e.expected_date = Date.today.advance(days: rand(-30..200))
    e.name = "expense #" + rand(20).to_s
    e.expense_types_id = [2, 3].sample
    e.save
  end
end
