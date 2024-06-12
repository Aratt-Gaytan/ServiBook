Rails.application.routes.draw do
  get 'author/index'
  get 'author/show'
  get 'author/new'
  get 'author/edit'
  #get 'author/index'
  #get 'author/show'
  #get 'author/new'
  #get 'author/edit'

  root 'home#index'
  devise_for :users
  resources :authors

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


end
