class UsersController < ActionController::API

  def login
    unless params[:email_id].present? && params[:password].present?
      render json: {:status => false, :debug_message => "parameters missing"}, :status => 400
    else
      user = User.find_by_email_id(params[:email_id])
      if user.present? && user.authenticate(params[:password])

      else
        render json: {:status => false, :debug_message => "Invalid email or password"}, :status => 401
      end
    end
  end

  def logout
    
  end
  
end
