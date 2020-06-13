Rails.application.routes.draw do
  get 'categories/show'
  get 'favourites/index'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'users/new'
  get 'users/create'
  get '/about',to: 'home#about'
  mount Ckeditor::Engine => '/ckeditor'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :books
  get '/login',to: "sessions#index"
  post '/login',to: "sessions#create"
  delete '/logout',to: "sessions#destroy"
  post '/accept',to: "books#change_status"
  get '/books/get_type', to: "books#get_type"
  get '/search_admin', to: "books#search_admin"
  get '/register',to: "users#new"
  get '/search', to: "books#search_user"

  get '/add_favourite', to: "favourites#change_favourite"
  resources :users
  resources :favourites
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
end
