class UsersController < ApplicationController

  # skip AUTHENTICATION for create
  skip_before_action :authenticate_request, only: [:create]

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
      render json: {success:true,message:"User Created Successfully",email:@user.email,username:@user.username,address:@user.address,mobile:@user.mobile}
    else
      render json: {success:false,message:"Unable To Create User"}
    end
  end

  # Add new user
  def add_user
    @user = User.new(email:params[:email],username:params[:username],address:params[:address],mobile:params[:mobile],password:"root",password_confirmation:"root",created_by:@current_user.id)
    if @user.save
      @user.token = nil
      @user.save
      render json: {success:true,message:"User Added Successfully",email:@user.email,username:@user.username,address:@user.address,mobile:@user.mobile}
    else
      render json: {success:false,message:"Unable To Add User"}
    end
  end

  # Get All User Created By Current User
  def all_users
    @user = User.where(created_by: @current_user.id).select(:id,:email,:username,:mobile,:address)
    if @user.present?
      render json: {success:true,data:@user}
    else
      render json: {success:false,message:"No Records Found"}
    end
  end
  # user parameters for new user
  private
    def users_params
      params.permit(:email,:username,:address,:mobile,:password,:password_confirmation)
    end
end
