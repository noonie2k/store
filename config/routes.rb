Store::Application.routes.draw do
  root to: 'home#index'

  resources :authors
  resources :books

  controller :search do
    post 'search' => :perform
  end
end
