class HomeController < ApplicationController
  def dashboard
    require "date"

    #calculate total incomes by month

    ###grab incomes from this user

    matching_incomes = Income.where(:users_id => @current_user.id)
    @list_of_incomes = matching_incomes.order({ :expected_date => :asc })

    #calculate total expenses by month
    #subtract total expenses from total income for each month to find net cash intake
    #show steps 1-3 in a table, show step 3 in a graph for each month

    render({ :template => "home/home_page.html.erb" })
  end
end
