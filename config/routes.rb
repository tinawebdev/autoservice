Rails.application.routes.draw do
  root "pages#home"

  get "orders/filter/:filter" => "orders#index", as: :filtered_orders

  resources :services
  resources :mechanics
  resources :orders
  resources :categories
end
