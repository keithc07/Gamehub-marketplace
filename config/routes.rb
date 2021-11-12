Rails.application.routes.draw do
  resources :marketplaces

  devise_for :users

  get 'marketplaces/new', to: "marketplaces#new", as: "posts"
  
  root to: 'marketplaces#index'
end
