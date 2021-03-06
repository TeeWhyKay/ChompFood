Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]
  get 'cart', to: 'food_orders#show', as: :cart
  post 'cart', to: 'food_orders#cart_info', as: :cart_info
  get 'restaurants/:id', to: 'food_orders#show', as: :cart_popup

  resources :orders, only: [:index]
  post 'orders', to: 'orders#create', as: :order_create
  get 'success', to: 'orders#success', as: :order_success

  resources :payments, only: [:create]
end
