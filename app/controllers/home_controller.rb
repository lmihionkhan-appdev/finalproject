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

    @mar_net_cash = @mar_monthly_income - @mar_monthly_expenses

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

    @apr_net_cash = @apr_monthly_income - @apr_monthly_expenses

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

    @may_net_cash = @may_monthly_income - @may_monthly_expenses

    #June metrics

    @jun_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 6
        @jun_monthly_income = @jun_monthly_income + @income_amount
      end
    end

    @jun_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 6
        @jun_monthly_expenses = @jun_monthly_expenses + @expense_amount
      end
    end

    @jun_net_cash = @jun_monthly_income - @jun_monthly_expenses

    #July metrics

    @jul_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 7
        @jul_monthly_income = @jul_monthly_income + @income_amount
      end
    end

    @jul_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 7
        @jul_monthly_expenses = @jul_monthly_expenses + @expense_amount
      end
    end

    @jul_net_cash = @jul_monthly_income - @jul_monthly_expenses

    #Aug metrics

    @aug_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 8
        @aug_monthly_income = @aug_monthly_income + @income_amount
      end
    end

    @aug_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 8
        @aug_monthly_expenses = @aug_monthly_expenses + @expense_amount
      end
    end

    @aug_net_cash = @aug_monthly_income - @aug_monthly_expenses

    #Sept metrics

    @sep_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 9
        @sep_monthly_income = @sep_monthly_income + @income_amount
      end
    end

    @sep_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 9
        @sep_monthly_expenses = @sep_monthly_expenses + @expense_amount
      end
    end

    @sep_net_cash = @sep_monthly_income - @sep_monthly_expenses

    #Oct metrics

    @oct_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 10
        @oct_monthly_income = @oct_monthly_income + @income_amount
      end
    end

    @oct_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 10
        @oct_monthly_expenses = @oct_monthly_expenses + @expense_amount
      end
    end

    @oct_net_cash = @oct_monthly_income - @oct_monthly_expenses

    #Nov metrics

    @nov_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 11
        @nov_monthly_income = @nov_monthly_income + @income_amount
      end
    end

    @nov_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 11
        @noc_monthly_expenses = @nov_monthly_expenses + @expense_amount
      end
    end

    @nov_net_cash = @nov_monthly_income - @nov_monthly_expenses

    #Dec metrics

    @dec_monthly_income = 0

    @list_of_incomes.each do |thing|
      @income_month = thing.expected_date.month
      @income_amount = thing.amount

      if @income_month == 12
        @dec_monthly_income = @dec_monthly_income + @income_amount
      end
    end

    @dec_monthly_expenses = 0

    @list_of_expenses.each do |thing|
      @expense_month = thing.expected_date.month
      @expense_amount = thing.amount

      if @expense_month == 12
        @dec_monthly_expenses = @dec_monthly_expenses + @expense_amount
      end
    end

    @dec_net_cash = @dec_monthly_income - @dec_monthly_expenses

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
