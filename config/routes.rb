Rails.application.routes.draw do
  resources :services
  resources :mechanics
  resources :orders
  resources :categories

  # Defines the root path route ("/")
  # root "articles#index"
end
