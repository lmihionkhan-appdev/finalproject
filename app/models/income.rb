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
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })

  #validates :income_type, inclusion: { in: %w(529 loan scholarship investments savings) }

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })
end
