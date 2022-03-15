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
end
