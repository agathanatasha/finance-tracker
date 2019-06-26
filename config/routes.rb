Rails.application.routes.draw do
  get 'user_stocks/create'
  devise_for :users, controllers: { registrations: "user/registrations" }
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
end
