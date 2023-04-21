# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  belongs_to(:user)
  belongs_to :owner, class_name: "User"
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
end
