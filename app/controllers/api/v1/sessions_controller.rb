class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticated

  def create
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
    params.permit(:username)
  end
end
