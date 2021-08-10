Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:index, :show]

  resources :posts do
    resources :comments
    resources :elements
  end
end
