Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root 'welcome#home'

  # resources :daily_picks, only: [:index] delete this pls

  post "/products/new", to: "products#new"

  resources :products

  resources :line_products, only: [:new, :create, :show, :index]


  resources :carts
  get 'carts/:id/checkout', to: 'carts#checkout'
  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  resources :users do
    resources :products
    resources :addresses
      resources :messages
  end

end
