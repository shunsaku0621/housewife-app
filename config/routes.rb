Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index, :show]
  resources :posts do 
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :cooks do 
    resource :favorites, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :blogs
  resources :incomes, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :getmoneys, only: [:new, :create, :edit, :update, :destroy]
end
