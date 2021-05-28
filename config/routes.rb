Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  resources :users, only: [:show]
  root to: 'posts#index'
  resources :posts, except: [:index]
  # get "posts/:id/previous" => "posts#previous"
  # get "posts/:id/next" => "posts#next"
end
