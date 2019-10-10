class FriendsController < ApplicationController
  def index
    @friends = Pilot.find(current_user.id).friends
  end
  

  private

  def set_friend
    @friend = Pilot.find(current_user.id).friends.find(params[:id])
  end

  def destroy
    Pilot.find(current_user.id).remove_friend(@friend)
    head :no_content
  end
end
