class SessionsController < ApiController


  def login
    unless params[:email_id].present? && params[:password].present?
      render json: {:status => false, :debug_message => "parameters missing"}, :status => 400
    else
      user = User.find_by_email_id(params[:email_id])
      if user.present? && user.authenticate(params[:password])
        access_token = user.generate_access_token
        render json: {:status => true, :data => {user_email_id: params[:email_id], user_access_token: access_token}, :message => "user logged in successfully"}, :status => 200
      else
        render json: {:status => false, :data => {}, :message => "Invalid email or password"}, :status => 401
      end
    end
  end

  def logout
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_access_token(token) rescue nil
      if user.present?
        user.update_attributes(access_token: nil)
      end
      render json: {:status => true, :message => "User logged out successfully"}, status: 200
    end
  end
  
end
