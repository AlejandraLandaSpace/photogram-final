class UserController < ApplicationController
  def index
    @user = User.all
   render({ :template => "user/index.html.erb" })
  end
  def show
     user = params.fetch("username")
     matching_user = User.where({:username=>user}).first
     @the_user = matching_user
     
     the_photos = Photo.all
     @photo = Photo.where({owner_id:matching_user.id})
    render({:template => "user/show.html.erb"})
  end
  
end
