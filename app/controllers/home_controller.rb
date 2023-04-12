class HomeController < ApplicationController
  def index
    @user = User.all
   
    render({ :template => "home/index.html.erb" })
  end
end
