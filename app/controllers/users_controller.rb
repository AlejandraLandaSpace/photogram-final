class UsersController < ApplicationController
  def index
    users = User.all
    @list_of_users = users.order({:username => :asc})
    
    render({ :template => "user/index.html.erb" })
  end

  def show
    user = params.fetch("username")
    matching_user = User.where({ :username => user }).first
    @the_user = matching_user


    follow_requests = FollowRequest.all
    @follow_request_list = follow_requests.order({:created_at => :desc})
    
    # pending_ids = FollowRequest.where(sender_id: @the_user.id, status: "pending").pluck(:recipient_id)

    #   @pending_follower = User.where({:id => pending_ids})
      
    # the_photos = Photo.all
    # @photo = Photo.where({ owner_id: matching_user.id })

    if session.fetch(:user_id) != nil
    render({ :template => "user/show.html.erb" })
    else 
      redirect_to("/user_sign_in", { :alert => "You need to sign in first." })
    end
  end
  
  def liked_photos
    @photos = @current_user.photos

    render({:template=>"user/liked_photos.html.erb"})
  end

  def feed
    # user = params.fetch("username")
    # @matching_user = User.where({ :username => user }).first
    # @the_user = @matching_user
     
    # # @feed = Photo.where({owner_id: @following})
    # following_ids = FollowRequest.where(sender_id: @the_user.id, status: "accepted").pluck(:recipient_id)
    
    # pending_ids = FollowRequest.where(sender_id: @the_user.id, status: "pending").pluck(:recipient_id)

    #   @pending_follower = User.where({:id => pending_ids})

    # @feed = Photo.where(owner_id: following_ids)
   


    render({:template=>"user/feed.html.erb"})
  end
  def discover
#     user = params.fetch("username")
#     matching_user = User.where({ :username => user }).first
#     @the_user = matching_user
#     the_photos = Photo.all
   
#    #get the images that the users followers have liked
#   # Get the IDs of the users that the current user is following
#     following_ids = FollowRequest.where(sender_id: @the_user.id, status: "accepted").pluck(:recipient_id)

# # Get the photos that have been liked by the users that the current user is following
#    @photos =  Photo.where({})

    
    render({:template=>"user/discover.html.erb"})
  end

end
