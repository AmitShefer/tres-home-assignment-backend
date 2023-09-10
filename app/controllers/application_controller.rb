class ApplicationController < ActionController::Base

  protect_from_forgery
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization'].split(' ').last
    begin
      @decoded = Auth::JwtUtils.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

end
