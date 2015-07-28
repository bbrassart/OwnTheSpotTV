Rails.application.routes.draw do
  get '/' => 'skaters#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :skaters
  resources :spots


end
