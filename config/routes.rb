Rails.application.routes.draw do
  resources :mechanics
  resources :orders

  # Defines the root path route ("/")
  # root "articles#index"
end
