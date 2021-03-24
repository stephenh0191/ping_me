Rails.application.routes.draw do
  

  resources :friendships  
  resources :images
  root 'chatroom#index' 	 
  post 'message', to: 'messages#create'
   resources :usersinfo 
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post "login", to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  delete 'login', to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end
