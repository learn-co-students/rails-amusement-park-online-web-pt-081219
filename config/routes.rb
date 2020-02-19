Rails.application.routes.draw do
  root "static_pages#home"
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  # get '/session', to: 'session#destroy'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
  # post '/logout' => 'session#destroy'
end

