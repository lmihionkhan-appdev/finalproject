# == Schema Information
#
# Table name: expense_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExpenseType < ApplicationRecord

  belongs_to(:expenses, { :required => true, :class_name => "Expense", :foreign_key => "expense_types_id" })

end
