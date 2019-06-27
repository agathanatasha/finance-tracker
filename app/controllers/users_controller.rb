class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @stocks = @user.stocks
    end
    
    def my_friends

    end
end