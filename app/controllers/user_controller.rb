class UserController < ApplicationController
  def index
    @user = User.all
   render({ :template => "user/index.html.erb" })
  end
  def show
     user = params.fetch("username")
     matching_user = User.where({:username=>user})
     @the_user = matching_user.first

     the_photos = Photo.all
     @photo = the_photos.at(0)
    
    render({:template => "user/show.html.erb"})
  end
  
end
