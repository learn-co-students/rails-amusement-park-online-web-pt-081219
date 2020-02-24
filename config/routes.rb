Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides, only: [:create]
   
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  root 'welcome#home'
end
