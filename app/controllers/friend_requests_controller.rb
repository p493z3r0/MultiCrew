class FriendRequestsController < ApplicationController
    before_action :set_friend_request, except: [:index, :create]
    


    def create
      friend = Pilot.find(params[:pilot_id])
      @friend_request = current_user.friend_requests.new(friend: friend)
  
      if @friend_request.save
        render :show, status: :created, location: @friend_request
      else
        render json: @friend_request.errors, status: :unprocessable_entity
      end
    end
    
    private
  
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end
    def index
        @incoming = FriendRequest.where(friend: Pilot.find(current_user.id))
        @outgoing = Pilot.find(current_user.id).friend_requests
    end

    def destroy
        @friend_request.destroy
        head :no_content
    end

    def not_friends
        errors.add(:friend, 'is already added') if user.friends.include?(friend)
    end
    
    def not_pending
        errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(user)
    end
end
