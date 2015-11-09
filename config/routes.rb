Rails.application.routes.draw do

  root 'site#home'
  get '/oauth/connect' => 'instagrams#redirection', as: 'instagram_auth'
  get '/oauth/callback' => 'instagrams#callback'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/rules' => 'site#rules'
  get '/contacts' => 'contacts#new'
  get '/about-us' => 'site#about'
  post '/votes/like' => 'votes#like'
  post '/votes/dislike' => 'votes#dislike'
  match '/contact',     to: 'contacts#new',             via: 'get'
  resources :contacts, only: [:new, :create]
  resources :skaters
  resources :spots, only: [:index, :show]
  resources :videos
  get '/rankings' => 'votes#index'

  namespace :api do
    namespace :v1 do
      get 'spots' => 'spots#get_all'
    end
  end

end
