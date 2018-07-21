class AuthenticationController < ApplicationController

  skip_before_action :authenticate_request, only: [:authenticate]

  def authenticate
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      @user.regenerate_token
      render json: {success:true,email:@user.email,token:@user.token}
    else
      render json: {success:false,message:"Invalid User Id Or Password"}
    end
  end

  def logout
    if @current_user
      @current_user.token = nil
      @current_user.save
      render json: {success:true,message:"Successfully Log Out"}
    else
      render json: {sucess:false,message:"Invalid Request"}
    end
  end
end
