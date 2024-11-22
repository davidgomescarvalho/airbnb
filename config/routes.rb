Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'

  namespace :api do
     resources :wishlists, only: [:create, :destroy]
  end

  resources :properties, only: [:show] do
    resources :bookings, only: [:new]
  end

  resources :booking_payments, only: [:create]

  get "booking_payments/success", to: "booking_payments#success"

  resources :wishlists, only: [:index]

  resources :profiles, only: [:index]

  resources :reservations, only: [:index] do
    resources :reviews, only: [:new]
  end
end
