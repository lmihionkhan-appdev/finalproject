# == Schema Information
#
# Table name: incomes
#
#  id              :integer          not null, primary key
#  amount          :float
#  expected_date   :date
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  income_types_id :integer
#  users_id        :integer
#
class Income < ApplicationRecord
  validates(:amount, { :presence => true })
  validates(:expected_date, { :presence => true })
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })

  #validates :income_type, inclusion: { in: %w(529 loan scholarship investments savings) }

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })
end
