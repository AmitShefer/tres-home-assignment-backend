class V1::AuthController < ApplicationController

  skip_before_action :authorize_request

  def authenticate
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = Auth::JwtUtils.encode(user_id: user.id)
      render json: { access_token: token, user: user }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

end
