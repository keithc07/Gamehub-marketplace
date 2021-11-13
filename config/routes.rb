Rails.application.routes.draw do
  resources :listings

  devise_for :users
  
  get '/button', to: 'listings#button', as: 'button'

  root to: 'listings#index'
end
