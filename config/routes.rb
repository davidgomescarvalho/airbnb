Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'

  namespace :api do
     resources :wishlists, only: [:create, :destroy]
  end

  resources :properties, only: [:show]
end
