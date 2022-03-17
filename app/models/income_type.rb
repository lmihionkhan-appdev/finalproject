# == Schema Information
#
# Table name: income_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class IncomeType < ApplicationRecord
  
  belongs_to(:incomes, { :required => true, :class_name => "Income", :foreign_key => "income_types_id" })

end
