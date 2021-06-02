Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  resources :users, only: [:show]
  root to: 'posts#index'
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
