class ExpensesController < ApplicationController
  def index
    matching_expenses = Expense.where(:users_id => @current_user.id)

    @list_of_expenses = matching_expenses.order({ :created_at => :desc })

    render({ :template => "expenses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_expenses = Expense.where({ :id => the_id })

    @the_expense = matching_expenses.at(0)

    render({ :template => "expenses/show.html.erb" })
  end

  def trip_index
    matching_trips = Trip.where(:users_id => @current_user.id)
    @list_of_trips = matching_trips.order({ :created_at => :desc })

    #list_of_matching_expenses = Expense.where(:users_id => @current_user.id)

    #list_of_matching_expenses.each do |an_expense|
    #@new_hash = Hash.new

    #if an_expense.trips_id == !nil
    # @new_hash.push("an_expense")
    #end
    #end

    render({ :template => "expenses/trips/trip_index.html.erb" })
  end

  def add_trip
    the_trip = Trip.new
    the_trip.name = params.fetch("query_name")
    the_trip.expected_date = params.fetch("query_expected_date")
    the_trip.users_id = @current_user.id

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "Trip created successfully." })
    else
      redirect_to("/trips", { :alert => the_expense.errors.full_messages.to_sentence })
    end
  end

  def create_trip_expense
    the_expense = Expense.new
    the_expense.name = params.fetch("query_name")
    the_expense.amount = params.fetch("query_amount")
    the_expense.expected_date = params.fetch("query_expected_date")
    the_expense.expense_types_id = params.fetch("query_expense_types_id")
    the_expense.trips_id = params.fetch("query_trips_id")
    the_expense.users_id = @current_user.id

    if the_expense.valid?
      the_expense.save
      redirect_to("/trips/#{the_expense.trips_id}", { :notice => "Trip updated successfully." })
    else
      redirect_to("/trips/#{the_expense.trips_id}", { :alert => "Could not update trip, try again." })
    end
  end

  def trip_details
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id, :users_id => @current_user.id })

    @the_trip = matching_trips.at(0)

    @matching_trip_expenses = Expense.where({ :trips_id => @the_trip.id, :expense_types_id => 1 })

    @list_of_trip_expenses = @matching_trip_expenses.order({ :expected_date => :desc })

    render({ :template => "expenses/trips/trip_show.html.erb" })
  end

  def create
    the_expense = Expense.new
    the_expense.name = params.fetch("query_name")
    the_expense.amount = params.fetch("query_amount")
    the_expense.expected_date = params.fetch("query_expected_date")
    the_expense.expense_types_id = params.fetch("query_expense_types_id")
    the_expense.trips_id = nil
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
    the_expense.expense_types_id = params.fetch("query_expense_types_id")
    the_expense.users_id = @current_user.id

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses/#{the_expense.id}", { :notice => "Expense updated successfully." })
    else
      redirect_to("/expenses/#{the_expense.id}", { :alert => the_expense.errors.full_messages.to_sentence })
    end
  end

  def update_trip
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.name = params.fetch("query_name")
    the_trip.expected_date = params.fetch("query_expected_date")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Expense updated successfully." })
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => "Unable to modify trip, please try again." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.destroy

    redirect_to("/expenses", { :notice => "Expense deleted successfully." })
  end

  def destroy_trip
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    matching_trip_expenses = Expense.where({ :trips_id => the_trip.id, :expense_types_id => 1 })

    # destroy all expenses with the trip

    matching_trip_expenses.each do |thing|
      thing.destroy
    end

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip and related expenses deleted successfully." })
  end
end
