class FriendshipsController < ApplicationController
    def create
    pilot = Pilot.find(current_user.id)
    @friendship = pilot.friendships.build(:friend_id => params[:friend_id])
 
    if pilot.friendships.where(:pilot_id => pilot.id, :friend_id  => params[:friend_id]).exists?
      flash[:alert] = "You have already added " + Pilot.find(params[:friend_id]).name + " " + Pilot.find(params[:friend_id]).lastname +  " as a friend."
      redirect_to root_url
      return
    end

    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
end


end
