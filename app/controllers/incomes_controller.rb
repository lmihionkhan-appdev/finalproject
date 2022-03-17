class IncomesController < ApplicationController
  def index
    matching_incomes = Income.where(:users_id => @current_user.id)

    @list_of_incomes = matching_incomes.order({ :created_at => :desc })

    render({ :template => "incomes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_incomes = Income.where({ :id => the_id })

    @the_income = matching_incomes.at(0)

    render({ :template => "incomes/show.html.erb" })
  end

  def create
    the_income = Income.new
    the_income.name = params.fetch("query_name")
    the_income.amount = params.fetch("query_amount")
    the_income.income_types_id = params.fetch("query_income_types_id")
    the_income.expected_date = params.fetch("query_expected_date")
    the_income.users_id = @current_user.id

    if the_income.valid?
      the_income.save
      redirect_to("/incomes", { :notice => "Income created successfully." })
    else
      redirect_to("/incomes", { :alert => the_income.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_income = Income.where({ :id => the_id }).at(0)

    the_income.name = params.fetch("query_name")
    the_income.amount = params.fetch("query_amount")
    the_income.income_types_id = params.fetch("query_income_types_id")
    the_income.expected_date = params.fetch("query_expected_date")
    the_income.users_id = @current_user.id

    if the_income.valid?
      the_income.save
      redirect_to("/incomes/#{the_income.id}", { :notice => "Income updated successfully." })
    else
      redirect_to("/incomes/#{the_income.id}", { :alert => the_income.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_income = Income.where({ :id => the_id }).at(0)

    the_income.destroy

    redirect_to("/incomes", { :notice => "Income deleted successfully." })
  end
end
