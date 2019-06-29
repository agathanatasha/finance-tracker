class FriendshipsController < ApplicationController
    def destroy
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        @friendship.destroy
        flash[:danger] = "User #{@friendship.friend.full_name} is no longer your friend"
        redirect_to my_friends_path
    end
end