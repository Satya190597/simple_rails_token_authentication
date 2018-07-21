class UsersController < ApplicationController

  skip_before_action :authenticate_request, only: [:create]

  def welcome
    render json: {success:true,message:"Welcome User",token: @current_user.token,email: @current_user.email}
  end

  def create
    @user = User.new(users_params)
    if @user.save
      @user.token = nil
      @user.save
      render json: {success:true,message:"User Created Successfully"}
    else
      render json: {success:false,message:"Unable To Create User"}
    end
  end

  private
  def users_params
    params.permit(:email,:username,:password,:password_confirmation)
  end

end
