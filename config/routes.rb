Rails.application.routes.draw do
  
  root 'chatroom#index' 	 
  post 'message', to: 'messages#create'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post "login", to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  delete 'login', to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end
