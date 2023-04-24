# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  belongs_to :recipient, { :required => true, :class_name => "User", :foreign_key => "recipient_id" }
  
  belongs_to :sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" }

  has_many :following_photos, {:through => :recipient, :source => :photos}

  before_create :set_status

  # TODO handle private here somehow
  def set_status
    if recipient.private
      self.status = "pending"
    else
      self.status = "accepted"
    end
  end
  
end
