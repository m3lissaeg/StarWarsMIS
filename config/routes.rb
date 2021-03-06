Rails.application.routes.draw do
  resources :missions do
    resources :squads do
      resources :crews
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :droids
  resources :ships
  resources :locations
  resources :users, except: [:destroy]
  root to: "missions#index"
  
  get "/error404", to: "static_pages#error404"
  get "/error401", to: "static_pages#error401"
end
