Rails.application.routes.draw do

  # Routes for the Income resource:

  # CREATE
  post("/insert_income", { :controller => "incomes", :action => "create" })

  # READ
  get("/incomes", { :controller => "incomes", :action => "index" })

  get("/incomes/:path_id", { :controller => "incomes", :action => "show" })

  # UPDATE

  post("/modify_income/:path_id", { :controller => "incomes", :action => "update" })

  # DELETE
  get("/delete_income/:path_id", { :controller => "incomes", :action => "destroy" })

  #------------------------------

  # Routes for the Expense resource:

  # CREATE
  post("/insert_expense", { :controller => "expenses", :action => "create" })

  # READ
  get("/expenses", { :controller => "expenses", :action => "index" })

  get("/expenses/:path_id", { :controller => "expenses", :action => "show" })

  # UPDATE

  post("/modify_expense/:path_id", { :controller => "expenses", :action => "update" })

  # DELETE
  get("/delete_expense/:path_id", { :controller => "expenses", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
