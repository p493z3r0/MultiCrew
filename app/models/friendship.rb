class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :pilot
  belongs_to :friend, class_name: 'Pilot'

  private

  def create_inverse_relationship
    friend.friendships.create(friend: pilot)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: pilot)
    friendship.destroy if friendship
  end
end
