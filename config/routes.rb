Rails.application.routes.draw do
  resources :teams
  resources :divisions do
    resources :tournaments
  end
  resources :matches
  resources :pictures
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'statics#home'

  get '/home', to: 'statics#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'comments/:id', to: 'comments#update', as: 'comment_update'

  post 'add_team/:id', to: 'tournaments#add_team', as: 'add_team'
end
