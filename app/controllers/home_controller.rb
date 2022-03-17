class HomeController < ApplicationController
  def dashboard
    require("date")

    #calculate total incomes by month

    ###grab incomes from this user

    matching_incomes = Income.where(:users_id => @current_user.id)

    ###sort incomes by month
    @list_of_incomes = matching_incomes.order({ :expected_date => :desc })

    #sum all incomes for jan
    @total_monthly_income = 0

    @list_of_incomes.each do |thing|
      @check_month = thing.expected_date.month

      if check_month = 1
        grab_amount = thing.amount
      end
      @total_monthly_income = @total_monthly_income + grab_amount
    end

    #if @months = 1
    #@jan_incomes = an_income.pluck(:amount).sum
    #end

    #@jan_incomes = @list_of_incomes.where({ :expected_date => 1 })

    #####TA RECOMMENDATION:

    #@total_income = @list_of_incomes.pluck(:amount).sum

    #target_month = 1

    #while target_month <= 12

    #@list_of_incomes.each do |an_income|

    #@monthly_incomes = @matching_incomes.where({ :expected_date.Date.month => target_month })

    #@total_monthly_income = 0

    # @monthly_incomes.each do |a_thing|
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
