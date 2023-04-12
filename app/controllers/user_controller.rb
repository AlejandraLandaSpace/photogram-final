class UserController < ApplicationController
  def index
    @user = User.all
   render({ :template => "user/index.html.erb" })
  end
  def show
     user = params.fetch("username")
     matching_user = User.where({:id=>user})
     @the_user = matching_user.first
    render({:template => "user/show.html.erb"})
  end
  
end
