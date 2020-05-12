Rails.application.routes.draw do
  resources :laptops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  root to: "pages#index"

  resources :users
end
