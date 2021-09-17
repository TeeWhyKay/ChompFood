Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]
  get 'cart', to: 'food_orders#show', as: :cart
  post 'cart_info', to: 'food_orders#cart_info', as: :cart_info
  get 'restaurants/:id', to: 'food_orders#show', as: :cart_popup

  post 'orders', to: 'orders#create', as: :orders
  resources :orders, only: [:index]
  resources :payments, only: [:create]
end
