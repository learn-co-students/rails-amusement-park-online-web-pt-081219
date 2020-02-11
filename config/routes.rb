Rails.application.routes.draw do
  resources :users
  resources :attractions
  get '/signin' => "sessions#new"
  post '/signin' => 'sessions#create'
  root "users#new"
  get '/logout' => 'sessions#destroy'
  post '/attractions/:id' => 'users#ride'
end
