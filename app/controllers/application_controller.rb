class ApplicationController < ActionController::API

  before_action :authenticate_request

  private
    # Authenticate each request
    def authenticate_request
      email = request.headers['email']
      @current_user = User.find_by_email(email)

      if @current_user.tokenhash[request.remote_ip] == request.headers['Authorization'] && request.headers['Authorization']!=nil
        updateToken
      else
        removeToken
        render json:{success:false,message:"Unable To Authenticate"}
      end
    end

    # Update token each time a user send a request
    def updateToken
      @current_user.regenerate_token
      @current_user.tokenhash[request.remote_ip] = @current_user.token
      @current_user.save
    end

    # Remove the token if the request authentication is failed
    def removeToken
      if @current_user.tokenhash[request.remote_ip]
           @current_user.tokenhash.delete(request.remote_ip)
           @current_user.save
      end
    end
end
