class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user.username, token: token }, status: :ok
    else
      render json: { error: 'Invalid username' }, status: 400
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user.username, token: token }, status: :ok
    else
      render json: { error: 'Incorrect user' }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:username, :admin)
  end
end
