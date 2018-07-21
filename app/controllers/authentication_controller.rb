class AuthenticationController < ApplicationController

  skip_before_action :authenticate_request, only: [:authenticate]

  def authenticate
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      addClient
      render json: {success:true,email:@user.email,token:@user.tokenhash[request.remote_ip]}
    else
      render json: {success:false,message:"Invalid User Id Or Password"}
    end
  end

  def logout
    if @current_user
      removeClient
      render json: {success:true,message:"Successfully Log Out"}
    else
      render json: {sucess:false,message:"Invalid Request"}
    end
  end

  private
    # Add client with specific token
    def addClient
      @user.regenerate_token
      @user.tokenhash[request.remote_ip] = @user.token
      @user.save
    end
    # Remove the client
    def removeClient
      @current_user.tokenhash.delete(request.remote_ip)
      @current_user.save
    end
end
