class ApiController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization

  protected

  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_access_token(token) rescue nil
      if user.present?
        @current_user = user
      else
        render json: {status: false, message: "Please login again to continue"}, status: 401
      end
    end
  end

end