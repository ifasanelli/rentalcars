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

  get '/reports/sub_reports', to: 'reports#sub_reports'
  get '/reports/cat_reports', to: 'reports#cat_reports'
  get '/reports/mod_reports', to: 'reports#mod_reports'
  post '/reports/sub_results', to: 'reports#sub_results', format: 'csv'
  post '/reports/cat_results', to: 'reports#cat_results', format: 'csv'
  post '/reports/mod_results', to: 'reports#mod_results', format: 'csv'

  resources :car_rentals, only: [:show, :index]
  resources :cars
  resources :accessories, only: [:index, :show, :new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:show,:index, :create] do
        patch 'status', on: :member
      end
      resources :rentals, only: [:create, :destroy]
    end
  end
end
