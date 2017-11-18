Rails.application.routes.draw do

  root 'home#index'

  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  resources :users, only:[ :index, :show ]
  resources :information, only:[ :update ]
  resources :activities
end
