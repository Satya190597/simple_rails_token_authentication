# simple_rails_token_authentication
Rails Token Based Authentication.

# Routes
  post '/sign_up', :to => 'users#create' 
  post '/sign_in', :to => 'authentication#authenticate' 
  get '/welcome', :to => 'users#welcome' 
  get '/logout',  :to => 'authentication#logout' 
 
 
 # Header Information
 
 Authorization : user_token
 email : user_email
