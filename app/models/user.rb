# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:expenses, { :class_name => "Expense", :foreign_key => "users_id", :dependent => :destroy })
  has_many(:incomes, { :class_name => "Income", :foreign_key => "users_id", :dependent => :destroy })
  has_many(:trips, { :class_name => "Trip", :foreign_key => "users_id", :dependent => :destroy })

  def readonly?
    false
  end
end
