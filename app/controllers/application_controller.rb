class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :render_not_authenticated

  protected
  def authenticate!
    return render_not_authenticated unless user_id_in_token?
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render_not_authenticated
  end

  private
  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def auth_token
    @auth_token ||= Clark::Support::JwtToken.decode(http_token)
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def render_not_authenticated
    render json: {errors: ['Not Authenticated']}, status: :unauthorized
  end
end
