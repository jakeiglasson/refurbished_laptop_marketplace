Rails.application.routes.draw do
  devise_for :users
  resources :hard_drives
  resources :rams
  resources :cpus
  resources :laptop_brands
  resources :laptop_orders
  resources :laptops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  root to: "pages#index"

  resources :users
end
