Store::Application.routes.draw do
  root to: 'home#index'

  resources :users
  resources :authors
  resources :books

  controller :search do
    post 'search' => :perform
  end

  controller :sessions do
    get  'login'  => :new
    post 'login'  => :create
    get  'logout' => :destroy
  end
end
