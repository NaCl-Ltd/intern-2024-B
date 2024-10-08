Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root   "static_pages#home"
  get    "/lately",  to: "static_pages#lately"
  get    "/help",    to: "static_pages#help"
  get    "/delete",  to: "static_pages#delete"
  get    "/about",   to: "static_pages#about"
  get    "/contact", to: "static_pages#contact"
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy] do
  member do
    post :pin
    post :pin_out
    post :recover
  end
end
  resources :relationships,       only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
end
