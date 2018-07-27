Rails.application.routes.draw do

  post '/sign_up', :to => 'users#create'
  post '/sign_in', :to => 'authentication#authenticate'
  get '/welcome', :to => 'users#welcome'
  get '/logout',  :to => 'authentication#logout'
  post '/add_user', :to => 'users#add_user'
  get '/all_users', :to => 'users#all_users'

end
