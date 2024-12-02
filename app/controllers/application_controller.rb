class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception

  before_action :verify_authenticity_token, unless: -> { request.format.json? }

  attr_reader :current_admin

  # private

  def authentication_admin
    token = request.headers['Authorization']&.split(' ')&.last
    @current_admin = Admin.find_by(auth_token: token)

    render json: { message: 'Unauthorized access' }, status: :unauthorized unless @current_admin
  end
end

