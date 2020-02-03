Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries
  resources :car_categories
  resources :car_models
  resources :clients
  resources :rentals, only: [:index, :show, :new, :create, :destroy] do
    get 'results', on: :collection
    get 'start', on: :member
    post 'start', on: :member, to: 'rentals#confirm_start'

  end
  resources :cars
  resources :car_rentals, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:show,:index, :create] do
        patch 'status', on: :member
      end
      resources :rentals, only: [:create]
    end
  end
end
