Rails.application.routes.draw do
  root 'site#index'
  get '/end', to: 'site#end'
  post '/login', to: 'site#login'
  get '/logout', to: 'site#logout'
  get '/start', to: 'site#start'
  get '/expired', to: 'site#expired'

  resources :answers

  resources :users
end
