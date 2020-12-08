Rails.application.routes.draw do
  resources :attractions
  resources :rides, only: [:create]
  resources :users, only: [:new,:create, :show, :destroy, :update]
  get "/signin", to: "users#signin"
  post "/signed", to: "users#signed"
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
