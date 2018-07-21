class UsersController < ApplicationController

  # skip AUTHENTICATION for create
  skip_before_action :authenticate_request, only: [:create,:ipaddress]

  # welcome page
  def welcome
    render json: {success:true,message:"Welcome User",token: @current_user.token,email: @current_user.email}
  end

  # create new user
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

  # user parameters for new user
  private
  def users_params
    params.permit(:email,:username,:password,:password_confirmation)
  end

end
