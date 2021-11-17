class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(username: params[:id])
    render json: @user
  end
  
  def create
    @new_user = params
    render json: @new_user
  end
end
