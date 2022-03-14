class ExpensesController < ApplicationController
  def index
    matching_expenses = Expense.all

    @list_of_expenses = matching_expenses.order({ :created_at => :desc })

    render({ :template => "expenses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_expenses = Expense.where({ :id => the_id })

    @the_expense = matching_expenses.at(0)

    render({ :template => "expenses/show.html.erb" })
  end

  def create
    the_expense = Expense.new
    the_expense.name = params.fetch("query_name")
    the_expense.amount = params.fetch("query_amount")
    the_expense.expected_date = params.fetch("query_expected_date")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.users_id = @current_user.id

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses", { :notice => "Expense created successfully." })
    else
      redirect_to("/expenses", { :alert => the_expense.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.name = params.fetch("query_name")
    the_expense.amount = params.fetch("query_amount")
    the_expense.expected_date = params.fetch("query_expected_date")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.users_id = @current_user.id

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses/#{the_expense.id}", { :notice => "Expense updated successfully."} )
    else
      redirect_to("/expenses/#{the_expense.id}", { :alert => the_expense.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.destroy

    redirect_to("/expenses", { :notice => "Expense deleted successfully."} )
  end
end
