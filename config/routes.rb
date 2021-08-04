Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, exclude: [:index]
  # get '/post', to

  resources :posts

  # get '/posts/new', to: 'posts#new'

  # post '/posts/create', to: 'posts#create'

end
