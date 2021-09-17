Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]
  get 'my_cart', to: 'food_orders#index', as: :cart
  get 'restaurants/:id', to: 'food_orders#show', as: :cart_popup

  resources :orders, only: [:index]
  resources :payments, only: [:create]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
