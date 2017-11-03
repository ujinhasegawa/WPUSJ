Rails.application.routes.draw do

  root 'home#index'
  get  'home/index'

  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  resources :users, only:[ :index, :show ]
  resources :activities
end
