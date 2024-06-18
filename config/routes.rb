Rails.application.routes.draw do
  get 'loans/index'
  get 'loans/show'
  get 'loans/new'


  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  devise_for :users
  resources :authors
  resources :genres
  resources :books
  namespace :admin do
    resources :users
  end


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


end
