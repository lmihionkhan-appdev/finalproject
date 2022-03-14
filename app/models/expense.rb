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
  validates(:name, { :presence => true })
  validates(:expected_date, { :presence => true })
  validates(:expense_type, { :presence => true })
  validates(:amount, { :presence => true })

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })
end
