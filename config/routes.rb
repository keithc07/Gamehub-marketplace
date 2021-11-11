Rails.application.routes.draw do
  resources :marketplaces

  devise_for :users
  
  root to: 'marketplaces#index'
end
