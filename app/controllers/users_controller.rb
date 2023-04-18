class UsersController < ApplicationController
  def index
    @users = User.all

    render({ :template => "user/index.html.erb" })
  end

  def show
    user = params.fetch("username")
    matching_user = User.where({ :username => user }).first
    @the_user = matching_user

    the_photos = Photo.all
    @photo = Photo.where({ owner_id: matching_user.id })
    if session.fetch(:user_id) != nil
    render({ :template => "user/show.html.erb" })
    else 
      redirect_to("/user_sign_in", { :alert => "You need to sign in first." })
  end
end
  def liked_photos
    fan = User.where({:id=>@users.id}).first
    @likes = Like.where({:fan_id=>fan})
    render({:template=>"user/liked_photos.html.erb"})
  end
  def feed
    user = params.fetch("username")
    matching_user = User.where({ :username => user }).first
    @the_user = matching_user
    
   


    render({:template=>"user/feed.html.erb"})
  end
end
