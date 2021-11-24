class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticated

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user.username, token: token }, status: :ok
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  private

  def user_params
    params.permit(:username)
  end
end
