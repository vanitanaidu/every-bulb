Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

  root 'welcome#home'

  post "/products/new", to: "products#new"

  resources :products do
    resources :line_products, only: [:create, :show, :index]
end

  resources :daily_picks, only: [:index]

  resources :carts
  get 'carts/:id/checkout', to: 'carts#checkout'
  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  resources :users, only: [:new, :create, :show] do
    resources :addresses
      resources :messages
  end


end
