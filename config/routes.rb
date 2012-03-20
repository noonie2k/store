Store::Application.routes.draw do
  root to: 'home#index'

  resources :authors
  resources :books
end
