class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    if first_name || last_name
      return "#{first_name} #{last_name}".strip
    else
      return nil
    end
  end

  def stock_added? ticker_symbol
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end

  def under_stock_limit?
    user_stocks.count < 10
  end

  def can_add_stock? ticker_symbol
    under_stock_limit? && !stock_added?(ticker_symbol)
  end
end
