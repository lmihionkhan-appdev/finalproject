class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  require "date"

  def month
    my_date = self.expected_date

    my_transformed_date = Date.my_date

    my_month = my_transformed_date.month

    return my_month
  end
end
