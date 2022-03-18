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
  validates(:income_types_id, { :presence => true })

  #validates :income_type, inclusion: { in: %w(529 loan scholarship investments savings) }

  belongs_to(:users, { :required => true, :class_name => "User", :foreign_key => "users_id" })

  def month
    require "date"

    my_date = self.expected_date
    my_name = self.name

    my_transformed_date = Date.my_date

    month = my_transformed_date.month

    return month

    #matching_incomes = Income.where({ :expected_date => my_date, :name => my_name })

    #the_income = matching_incomes.at(0)

    #the_income.expected_date.month

    #return

    #def commenter
    #my_author_id = self.author_id

    #matching_users = User.where({ :id => my_author_id })

    #the_user = matching_users.at(0)

    #return the_user
  end

  def readonly?
    false
  end
end
