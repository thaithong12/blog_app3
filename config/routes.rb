Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  mount Ckeditor::Engine => '/ckeditor'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :books
  resources :comments
  get '/login',to: "sessions#index"
  post '/login',to: "sessions#create"
  delete '/logout',to: "sessions#destroy"
  post '/accept',to: "books#change_status"
  get '/books/get_type', to: "books#get_type"
  get '/search_admin', to: "books#search_admin"
  get '/register',to: "users#new"
  get '/search', to: "books#search_user"

  get '/favourite', to: "books#change_favourite"
  resources :users
end
