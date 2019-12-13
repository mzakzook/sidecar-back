class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]
 
  def show

    user = current_user
    
    render json: { user: user }, status: :accepted
  end

  def create
    @user = User.find_by(email: user_login_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      # byebug
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), token: token }, status: :accepted
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
 


  private
 
  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:email, :password)
  end
end
