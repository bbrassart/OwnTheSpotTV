Rails.application.routes.draw do

  root 'site#home'
  get '/videos/your-insta-links' => 'videos#links'
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
  post '/votes/report_poser' => 'votes#report_poser'
  match '/contact',     to: 'contacts#new',             via: 'get'
  resources :contacts, only: [:new, :create]
  resources :skaters
  resources :spots, only: [:index, :show]
  resources :videos
  get '/rankings' => 'votes#index'

  namespace :api do
    namespace :v1 do
      get 'spots' => 'api#spots'
      get 'video_leaderboard' => 'api#video_leaderboard'
      get 'likes_leaderboard' => 'api#likes_leaderboard'
      get 'spots/:id' => 'api#spot'
    end
  end

end
