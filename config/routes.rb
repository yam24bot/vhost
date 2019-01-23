Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users

  devise_for :users, controllers: { registrations: 'users/registrations', confirmations: 'confirmations' }

  root to: 'videos#index'

  resources :videos
  resources :users
  resources :banned
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
