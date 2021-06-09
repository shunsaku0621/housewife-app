Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :posts, only: [:index, :new, :create, :show]
end
