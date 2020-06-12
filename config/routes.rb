Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :books
  get '/login',to: "sessions#index"
  post '/login',to: "sessions#create"
  delete '/logout',to: "sessions#destroy"
  post '/accept',to: "books#change_status"
end
