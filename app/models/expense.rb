# == Schema Information
#
# Table name: expenses
#
#  id               :integer          not null, primary key
#  amount           :float
#  expected_date    :date
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  expense_types_id :integer
#  trips_id         :integer
#  users_id         :integer
#
class Expense < ApplicationRecord
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })
  validates(:expected_date, { :presence => true })
  validates(:expense_types_id, { :presence => true })
  validates(:amount, { :presence => true })

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })

  def readonly?
    false
  end
end
