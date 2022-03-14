# == Schema Information
#
# Table name: expenses
#
#  id            :integer          not null, primary key
#  amount        :string
#  expected_date :date
#  expense_type  :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  users_id      :integer
#
class Expense < ApplicationRecord
end
