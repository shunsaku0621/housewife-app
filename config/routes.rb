Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index, :show]
  resources :posts do 
    resources :comments, only: [:create]
  end
  get 'posts/search'
  resources :cooks do 
    resource :favorites, only: [:create, :destroy]
  end
  resources :blogs
end
