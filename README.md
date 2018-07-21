# simple_rails_token_authentication
Rails Token Based Authentication.

# Routes
  post '/sign_up', :to => 'users#create' <br />
  post '/sign_in', :to => 'authentication#authenticate' <br />
  get '/welcome', :to => 'users#welcome' <br />
  get '/logout',  :to => 'authentication#logout' <br />
 
 
 # Header Information
 
 Authorization : user_token <br />
 email : user_email <br />
