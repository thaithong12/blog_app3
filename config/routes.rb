Rails.application.routes.draw do
  get 'microposts/single'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :microposts
end
