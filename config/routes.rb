Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :skaters
  resources :spots
  resources :videos


end
