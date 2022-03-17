# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  expected_date :date
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Trip < ApplicationRecord

  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })
  validates(:expected_date, { :presence => true })

  has_many(:expenses, { :class_name => "Expense", :foreign_key => "trips_id")

end
