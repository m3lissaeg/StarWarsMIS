Rails.application.routes.draw do
  resources :crews
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :droids
  resources :ships
  resources :locations
  root to: "ships#index"
end
