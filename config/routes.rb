Rails.application.routes.draw do

  post '/sign_up', :to => 'users#create'
  post '/sign_in', :to => 'authentication#authenticate'
  get '/welcome', :to => 'users#welcome'
  get '/logout',  :to => 'authentication#logout'
  get '/ipaddress', :to => 'users#ipaddress'

end
