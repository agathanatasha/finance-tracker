class StocksController < ApplicationController
    def search
        if params[:stock].blank?
            flash.now[:danger] = "You have entered an empty search string"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "Cannot find a stock with this ticker symbol" unless @stock
        end
        respond_to do |format|
            format.js { render partial: 'users/stock_result' }
        end
    end
end