module AuthenticationHelper
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin
  end

  private

  def authenticate_admin
    token = request.headers['Authorization']
    if token.present?
      admin = Admin.find_by(authentication_token: token)
      if admin
        @current_admin = admin
      else
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end

  def current_admin
    @current_admin
  end
end

