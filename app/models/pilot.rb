class Pilot < ApplicationRecord
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :friend_requests, dependent: :destroy
    has_many :pending_friends, through: :friend_requests, source: :friend
    def remove_friend(friend)
        Pilot.find(current_user.id).friends.destroy(friend)
      end
end
