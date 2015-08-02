Rails.application.routes.draw do

  root 'site#home'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/rules' => 'site#rules'
  get '/contact' => 'site#contact'
  get '/about-us' => 'site#about'
  resources :skaters
  resources :spots
  resources :videos
  resources :votes



end
