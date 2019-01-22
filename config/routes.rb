Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'videos#index'

  resources :videos
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
