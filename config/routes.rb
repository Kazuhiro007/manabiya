Rails.application.routes.draw do
  resources :lessons
  root 'pages#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources 'users'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  get '/favorites', to: 'favorites#index'
  post '/participate', to: 'participates#create'
  delete '/participate', to: 'participates#destroy'
  get '/participates', to: 'participates#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
