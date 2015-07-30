Rails.application.routes.draw do
  root 'site#home'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :skaters
  resources :spots
  resources :videos


end
