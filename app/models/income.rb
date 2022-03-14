# == Schema Information
#
# Table name: incomes
#
#  id            :integer          not null, primary key
#  amount        :string
#  expected_date :date
#  income_type   :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  users_id      :integer
#
class Income < ApplicationRecord
  validates(:amount, { :presence => true })
  validates(:expected_date, { :presence => true })
  validates(:income_type, { :presence => true })
  validates(:name, { :presence => true })

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })
end