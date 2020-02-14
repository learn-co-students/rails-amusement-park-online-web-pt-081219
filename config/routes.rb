Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions
  root "welcome#home"
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
