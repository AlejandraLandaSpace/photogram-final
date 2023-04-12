class UserController < ApplicationController
  def index
    @user = User.all
   render({ :template => "user/index.html.erb" })
  end
  def show
     user = params.fetch("path_id")
     @each_user = user.at(0)
    render({:template => "user/show.html.erb"})
  end
  
end
