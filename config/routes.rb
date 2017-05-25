Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root 'welcome#home'


  resources :products
  post "/products/new", to: "products#new"

  resources :line_products, only: [:new, :create, :show, :index]

  resources :carts
  get 'carts/:id/checkout', to: 'carts#checkout'
  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  get 'users/:id/thankyou', to: 'users#thankyou'
  post 'users/:id/thankyou', to: 'users#thankyou', as: 'thankyou'


  resources :users do
    resources :products
    resources :addresses
      resources :messages
  end



end
