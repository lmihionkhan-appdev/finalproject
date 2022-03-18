# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  expected_date :date
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  users_id      :integer
#
class Trip < ApplicationRecord
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })
  validates(:expected_date, { :presence => true })

  has_many(:expenses, { :class_name => "Expense", :foreign_key => "trips_id" })
  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })

  def readonly?
    false
  end
end
