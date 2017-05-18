Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

  root 'welcome#home'

  resources :products
    post "/products/new", to: "products#new"
    
  resources :daily_pick, only: [:index]


end
