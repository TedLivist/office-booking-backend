class ApplicationController < ActionController::API
  before_action :authenticated

  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return nil unless auth_header

    token = auth_header.split[1]
    begin
      JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return nil unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authenticated
    render json: { message: 'Please log in' }, status: :unauthorized unless decoded_token
  end
end
