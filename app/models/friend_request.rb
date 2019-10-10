class FriendRequest < ApplicationRecord
  belongs_to :pilot
  belongs_to :friend, class_name: 'Pilot'
  def accept
    pilot.friends << friend
    destroy
  end
  def update
    @friend_request.accept
    head :no_content
  end

end
