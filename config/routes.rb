Rails.application.routes.draw do
  get '/auth/instagram', as: :login

  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'

  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
end
