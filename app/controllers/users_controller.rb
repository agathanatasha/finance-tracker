class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @stocks = @user.stocks
    end
    
    def my_friends
        @friendships = current_user.friends
    end

    def search
        if params[:friend_search_param].blank?
            flash.now[:danger] = "You have entered an empty search string"
        else
            @users = User.search(params[:friend_search_param])
            @users = current_user.except_current_user(@users)
            flash.now[:danger] = "No users match this search criteria" if @users.blank?
        end
        respond_to do |format|
            format.js { render partial: 'friends/result' }
        end
    end

    def add_friend
        @friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: @friend.id)        
        if current_user.save
            flash[:success] = "User #{@friend.full_name} is now your friend"
        else
            flash[:danger] = "Something went wrong. Please try again"
        end
        redirect_to my_friends_path
    end
end