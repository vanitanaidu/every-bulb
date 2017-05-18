Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users


  root 'welcome#home', as: 'welcome'

  resources :products, only: [:index, :new, :create]
  resources :daily_pick, only: [:index]


end
