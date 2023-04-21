# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:photos)
  has_many(:follow_request)
  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo
  # mount_uploader :image, ImageUploader

  def follow_request_for(other_user_id)
    FollowRequest.where({ sender_id: self.id, recipient_id: other_user_id }).at(0)
  end
end
