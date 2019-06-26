class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @stocks = @user.stocks
    end
end