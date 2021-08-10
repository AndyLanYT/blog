Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  resources :users, only: [:index, :show]

  resources :posts do
    resources :comments
  end
end
