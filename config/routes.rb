Rails.application.routes.draw do
  get 'comments/scaffold'
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
end
