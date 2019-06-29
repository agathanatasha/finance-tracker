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
      return "Anonymous"
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

  def self.search(search_param)
    search_param.strip!
    search_param.downcase!
    to_send_back = (first_name_matches(search_param) + 
                    last_name_matches(search_param) + 
                    email_matches(search_param)).uniq
    return nil unless to_send_back
    to_send_back
  end

  def self.first_name_matches(search_param)
    matches('first_name', search_param)
  end

  def self.last_name_matches(search_param)
    matches('last_name', search_param)
  end

  def self.email_matches(search_param)
    matches('email', search_param)
  end

  def self.matches(column, search_param)
    User.where("#{column} like?", "%#{search_param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end
end
