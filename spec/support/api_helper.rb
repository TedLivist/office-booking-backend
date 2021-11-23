# spec/support/api_helper.rb

module ApiHelper
  def authenticated_header(options)
    user = options[:user]
    token = JWT.encode({ user_id: user.id }, 'yourSecret')
    if options[:user] and options[:request]
      request = options[:request]
      request.headers.merge!(Authorization: "Bearer #{token}")
    else
      "Bearer #{token}"
    end
  end
end
