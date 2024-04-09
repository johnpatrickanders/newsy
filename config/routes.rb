Rails.application.routes.draw do
  get 'og_imager/dev_to'
  root   "static_pages#home"
  get    "/articles", to: "static_pages#articles"
  get    "/pages", to: "static_pages#pages"
  get    "/help",    to: "static_pages#help"
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
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :articles,            only: [:create, :destroy]
  resources :pages,               only: [:create, :edit, :update, :destroy]
  get '/microposts', to: 'static_pages#home' # Avoid routing error after erroneous post attempt + refresh
end
