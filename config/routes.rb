Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :manufacturers
<<<<<<< HEAD
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
=======
  resources :subsidiaries, only: [:index, :show, :new, :create]
>>>>>>> eb14f84cee60ed83edce76d6dbd424c9ae92227d
end
