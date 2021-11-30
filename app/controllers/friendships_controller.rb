class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendships = current_user.friendships.where(friend_id: params[:id]).first
    #byebug
    friendships.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path

  end
end