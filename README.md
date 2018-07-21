# simple_rails_token_authentication
Rails Token Based Authentication.

# Routes
  post '/sign_up', :to => 'users#create'_
  post '/sign_in', :to => 'authentication#authenticate'_
  get '/welcome', :to => 'users#welcome'_
  get '/logout',  :to => 'authentication#logout'_
 
 
 # Header Information
 
 Authorization : user_token_
 email : user_email_
