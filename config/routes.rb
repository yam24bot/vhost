Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { registrations: 'users/registrations', confirmations: 'confirmations' }

  root to: 'videos#index'

  resources :videos
  resources :banned

  resources :users do
    member do
      put 'update_ban_status'
    end
  end

end
