Rails.application.routes.draw do
  get 'home/about'
  get 'home/contact'
  get 'posts/index'
  devise_for :users
  resources :users, only: [:show]
  root to: 'posts#index'
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
      get 'sort'
    end
  end
end
