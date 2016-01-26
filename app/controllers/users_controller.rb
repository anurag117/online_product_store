class UsersController < ApiController

  def signup
    user = User.new(user_params)
    if user.save
      render json: {:status => true, :message => "Signup successful"}, :status => 200
    else
      render json: {:status => false, :message => "#{user.errors.full_messages}"}, :status => 422
    end
  end


  private

  def user_params
    params.require(:user).permit(:email_id, :password, :password_confirmation)
  end
  
end
