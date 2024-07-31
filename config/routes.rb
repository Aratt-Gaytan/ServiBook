Rails.application.routes.draw do
  get 'search', to: 'search#index'



  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  devise_for :users
  resources :authors
  resources :genres
  resources :books
#  resources :confirmations
  resources :loans do
    member do
      get :cancel
      get :acept
      get :return
    end
  end
  namespace :admin do
    resources :users
  end

  resources :users do
    member do
      get :confirm_email
    end
  end



  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


end
