Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
    collection do
      get :search
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  # resources :microposts do
  #   resource :zzzzzfavorites, only: [:create, :destroy]
  # end 
  
  resources :favorites, only: [:create, :destroy]
  
end
