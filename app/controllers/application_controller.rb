class ApplicationController < ActionController::API

  before_action :authenticate_request

  private
    def authenticate_request
      email = request.headers['email']
      @current_user = User.find_by_email(email)
      if @current_user.token == request.headers['Authorization'] && request.headers['Authorization']!=nil
        @current_user.regenerate_token
      else

        # Set token to nil if authentication is failed
        if @current_user
             @current_user.token=nil
             @current_user.save
        end
        render json:{success:false,message:"Unable To Authenticate"}
      end
    end
end
