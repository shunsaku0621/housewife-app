Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :posts
  resources :cooks do 
    resource :favorites, only: [:create, :destroy]
  end
end
