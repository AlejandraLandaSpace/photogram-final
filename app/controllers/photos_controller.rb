class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
    # user = User.all
    # @private_user = User.where({:private => false})
    render({ :template => "photos/index.html.erb" })
  end

  def show
    
    the_id = params.fetch("path_id")

    @matching_photos = Photo.where({ :id => the_id })

    @the_photo = @matching_photos.at(0)
    
    if session.fetch(:user_id) != nil
    render({ :template => "photos/show.html.erb" })
    else
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    end
  end

  def create
    the_photo = Photo.new
    the_photo.caption = params.fetch("query_caption")
    photo.comments_count = 0
    the_photo.image = params.fetch("query_image")
    photo.likes_count = 0
    the_photo.owner_id = session.fetch(:user_id)

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    photo.caption = params.fetch("query_caption")
    photo.comments_count = params.fetch("query_comments_count")
    photo.image = params.fetch("query_image")
    photo.likes_count = params.fetch("query_likes_count")
    photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{the_photo.id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
