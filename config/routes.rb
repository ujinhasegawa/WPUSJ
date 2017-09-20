Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get 'login',        to: 'users#login',       as: 'user_login'
  put 'confirm_auth', to: 'users#confirm_auth'
end
