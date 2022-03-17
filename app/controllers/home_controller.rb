class HomeController < ApplicationController
  def dashboard
    require "date"

    #calculate total incomes by month

    ###grab incomes from this user

    matching_incomes = Income.where(:users_id => @current_user.id)
    @list_of_incomes = matching_incomes.order({ :created_at => :desc })

    ###sum all incomes for each month
    #####TA RECOMMENDATION:

    @total_income = @list_of_incomes.pluck(:amount).sum

    ##or matching_incomes.pluck(:amount).each { |a| sum+=a.to_i }

    #target_month = 1

    #while target_month <= 12
    #@monthly_incomes = @matching_incomes.where({ :expected_date.Date.month => target_month })

    #@total_monthly_income = 0

    #@monthly_incomes.each do |a_thing|
    #amount = a_thing.amount.to_f
    #@total_monthly_income = amount + @total_monthly_income
    #end

    #target_month = target_month + 1
    #end

    #calculate total expenses by month
    #subtract total expenses from total income for each month to find net cash intake
    #show steps 1-3 in a table, show step 3 in a graph for each month

    render({ :template => "home/home_page.html.erb" })
  end
end
