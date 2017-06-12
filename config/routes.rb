Rails.application.routes.draw do

  resources :performances
  resources :teams
  resources :divisions do
    resources :tournaments
    get 'tournaments/:id/fixture', to: 'tournaments#fixture', as: 'fixture'
    post 'tournaments/:id/fixture', to: 'tournaments#new_fixture', as:'new_fixture'
  end
  resources :matches


  resources :pictures
  resources :comments
  resources :posts
  resources :users

  resources :invitations

  resources :playoffs, only: [:index, :new, :create]
  post '/playoffs/new', to: 'playoffs#new_create'
  get '/playoffs/new_match', to: 'playoffs#new_match'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'statics#home'

  get '/rooms/show', to: 'rooms#show'

  post '/invitations/create', to: 'invitations#create'
  post '/performances/create', to: 'performances#create'

  get '/home', to: 'statics#home'
  get '/table', to: 'statics#table', as: 'table'
  get '/scorers', to: 'statics#scorers', as: 'scorers'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'comments/:id', to: 'comments#update', as: 'comment_update'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
