class HomeController < ApplicationController
  def dashboard
    require("date")

    #calculate total incomes by month

    ###grab incomes from this user

    matching_incomes = Income.where(:users_id => @current_user.id)

    ###sort incomes by date
    @list_of_incomes = matching_incomes.order({ :expected_date => :desc })

    ###create array for months

    @a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    ###test loop with array

    @a.each do |a_month|
      @target_month = a_month

      ##income

      @monthly_income = 0

      @list_of_incomes.each do |an_income|
        @income_month = an_income.expected_date.month
        @income_amount = an_income.amount

        if @income_month == @target_month
          @monthly_income = @monthly_income + @income_amount
        end
      end
    end

    #Jan Incomes

    @jan_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 1
        @jan_monthly_income = @jan_monthly_income + @income_amount
      end
    end

    #Feb Incomes

    @feb_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 2
        @feb_monthly_income = @feb_monthly_income + @income_amount
      end
    end

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
