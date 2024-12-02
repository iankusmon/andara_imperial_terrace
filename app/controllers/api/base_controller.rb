module Api
  class BaseController < ActionController::API
    # Only Admin controllers use Cookies and Session middleware
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection

    # include ActionController::Serialization
    include ActionController::MimeResponds

    # Cookies are vulnerable to Cross-Site Request Forgery (CSRF)
    # Adds a before_action that compares the CSRF token in the request with the token in the session cookie to ensure they match.
    # Otherwise, an exception is raised.
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session

    # Mimic Rails behaviour for every request
    # "Real" CSRF token is simply being masked with a one-time pad to protect against SSL BREACH attacks
    # Rails reads 'X-CSRF-Token' header for non-GET request
    before_action :set_csrf_cookie

    rescue_from(
      ArgumentError,
      with: :internal_server_error
    )

    rescue_from(
      Api::BaseError,
      Api::Admins::BaseError,
      with: :base_error
    )

    # before_action for all protected routes of Admins
    def authenticate_admin
      return if cookies[:admin_id].present?

      render json: { error: "Session Admin not valid" }, status: :unauthorized
    end

    def current_admin
      @current_admin = Admin.find(session[:admin_id])
    end

    def internal_server_error(error)
      status_name = :internal_server_error
      status      = Rack::Utils::SYMBOL_TO_STATUS_CODE[status_name]
      render(
        json:   {
          status_name: status_name,
          status:      status,
          code:        'ArgumentError',
          title:       'Something went wrong in the server',
          messages:    {
            argument_error: [error.message]
          },
          server:      'Andara Imperial Terrace'
        },
        status: status
      )
    end

    def base_error(error)
      status = error.status
      render(
        json:   {
          status_name:  error.status_name,
          status:       status,
          code:         error.code,
          title:        error.title,
          messages:     error.messages,
          debug_values: error.debug_values,
          server:       error.server
        },
        status: status
      )
    end

    private

    def set_csrf_cookie
      is_secure = Rails.env.production? || Rails.env.staging?
      domain    = {
        development: :all,
        staging:     ['.andaraimperialterrace.click'],
        production:  ['.andaraimperialterrace.com']
      }.fetch(Rails.env.to_sym, :all)

      cookies['CSRF_TOKEN'] = {
        value:     form_authenticity_token,
        domain:    domain,
        same_site: :strict,
        secure:    is_secure,
        expires:   24.hours.from_now,
        admin_id:  session[:admin_id]
      }
    end

  end
end

