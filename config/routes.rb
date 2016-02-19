Rails.application.routes.draw do
  resources :posts

  post '/posts/retweet', to: 'posts#retweet'
  post '/posts/favorite', to: 'posts#favorite'
  get '/retweeted', to: 'dashboard#retweeted'
  get 'mentions', to: 'dashboard#mentions'
  get '/feed', to: 'dashboard#feed'
  # get '/posts', to: 'posts#index'
  get '/auth/twitter', as: :login

  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'

  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessiontest', to: 'sessions#create'
end
