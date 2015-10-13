Rails.application.routes.draw do

  root 'site#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/rules' => 'site#rules'
  get '/contacts' => 'contacts#new'
  get '/about-us' => 'site#about'
  post '/votes/like' => 'votes#like'
  post '/votes/dislike' => 'votes#dislike'
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources :contacts, only: [:new, :create]
  resources :skaters
  resources :spots, only: [:index, :show]
  resources :videos
  get '/rankings' => 'votes#index'

end
