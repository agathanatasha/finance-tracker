Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: "user/registrations" }

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'

  get 'search_stocks', to: 'stocks#search'

  resources :user_stocks, only: [:create, :destroy]
  get 'user_stocks/create'

  resources :users, only: [:show]
  resources :friendships

  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
end