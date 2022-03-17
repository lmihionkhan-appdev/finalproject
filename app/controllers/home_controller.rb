class HomeController < ApplicationController
  def dashboard
    require("date")

    #calculate total incomes by month

    ###grab incomes & expenses from this user

    matching_incomes = Income.where(:users_id => @current_user.id)
    matching_expenses = Expense.where(:users_id => @current_user.id)

    ###sort incomes & expenses by date
    @list_of_incomes = matching_incomes.order({ :expected_date => :desc })
    @list_of_expenses = matching_expenses.order({ :expected_date => :desc })

    #jan metrics

    @jan_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 1
        @jan_monthly_income = @jan_monthly_income + @income_amount
      end
    end

    @jan_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 1
        @jan_monthly_expenses = @jan_monthly_expenses + @expense_amount
      end
    end

    @jan_net_cash = @jan_monthly_income - @jan_monthly_expenses

    #Feb metrics

    @feb_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 2
        @feb_monthly_income = @feb_monthly_income + @income_amount
      end
    end

    @feb_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 2
        @feb_monthly_expenses = @feb_monthly_expenses + @expense_amount
      end
    end

    @feb_net_cash = @feb_monthly_income - @feb_monthly_expenses

    #Mar metrics

    @mar_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 3
        @mar_monthly_income = @mar_monthly_income + @income_amount
      end
    end

    @mar_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 3
        @mar_monthly_expenses = @mar_monthly_expenses + @expense_amount
      end
    end

    #Apr metrics

    @apr_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 4
        @apr_monthly_income = @apr_monthly_income + @income_amount
      end
    end

    @apr_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 4
        @apr_monthly_expenses = @apr_monthly_expenses + @expense_amount
      end
    end

    #May metrics

    @may_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 5
        @may_monthly_income = @may_monthly_income + @income_amount
      end
    end

    @may_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 5
        @may_monthly_expenses = @may_monthly_expenses + @expense_amount
      end
    end

    #####leveraging loops...copy to view page if list needed but formatting didn't work for chart or table

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

    ##add expenses, net cash flow calc as needed...

    #####TA RECOMMENDATION:

    #@total_income = @list_of_incomes.pluck(:amount).sum
    #Month <%= @target_month %> has <%= @net_cash_flow%> in net cash flow, with <%= @monthly_income %> in income and <%= @monthly_expense %> in expenses. </p>

    render({ :template => "home/home_page.html.erb" })
  end
end

##other notes:

#<% @a.each do |a_month| %>

#<% @target_month = a_month %>
#<% @monthly_income = 0 %>
#<% @monthly_expense = 0 %>

#  <% @list_of_incomes.each do |an_income| %>
#     <% @income_month = an_income.expected_date.month %>
#    <% @income_amount = an_income.amount %>
#
#       <%  if @income_month == @target_month %>
#        <% @monthly_income = @monthly_income + @income_amount %>
#      <% end %>
#
#   <% end %>

#    <% @list_of_expenses.each do |an_expense| %>
#   <% @expense_month = an_expense.expected_date.month %>
#  <% @expense_amount = an_expense.amount %>
#
#       <%  if @expense_month == @target_month %>
#        <% @monthly_expense = @monthly_expense + @expense_amount %>
#      <% end %>

#<% end %>

#<% @net_cash_flow = @monthly_income - @monthly_expense %>

# <% end %>
