module Api
  module Admins
    class SessionsController < ApplicationController
      def login
        # admin = Admin.find_by(email: params[:email])

        # if admin&.authenticate(params[:password])
        #   admin.generate_auth_token
        #   render json: { message: 'Login successful', auth_token: admin.auth_token }, status: :ok
        # else
        #   render json: { message: 'Invalid email or password' }, status: :unauthorized
        # end
        admin = Admin.find_by(
          email: params[:email],
          password: params[:password]
        )
        reset_session
        session[:admin_id] = admin.id
        set_csrf_cookie()
      end

      def logout
        authentication_admin
        if current_admin
          current_admin.update(auth_token: nil)
          render json: { message: 'Logout successful' }, status: :ok
        end
      end
    end
  end
end

