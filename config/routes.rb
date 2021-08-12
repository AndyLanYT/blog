Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:index, :show, :update] do
    member do
      patch :update_status
    end
  end

  resources :posts do
    resources :comments
    resources :elements
    member do
      patch :update_status
    end
  end
end
