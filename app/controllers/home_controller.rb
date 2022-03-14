class HomeController < ApplicationController
  def dashboard
    render({ :template => "home/home_page.html.erb" })
  end
end
