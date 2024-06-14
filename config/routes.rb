Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/delete'
  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  devise_for :users
  resources :authors
  resources :genres

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


end
