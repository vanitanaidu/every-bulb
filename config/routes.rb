Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users


  root 'welcome#index', as: 'welcome'

  resources :products, only: [:index, :new, :create, :show]
  resources :admin, only: [:new]


end
