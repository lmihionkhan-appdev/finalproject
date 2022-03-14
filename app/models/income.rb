# == Schema Information
#
# Table name: incomes
#
#  id            :integer          not null, primary key
#  amount        :string
#  expected_date :string
#  income_type   :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  users_id      :integer
#
class Income < ApplicationRecord
end
