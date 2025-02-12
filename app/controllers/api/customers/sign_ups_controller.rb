module Api
  module Customers
    # api/v2/customers/signups/...
    # Public Endpoint
    class SignUpsController < BaseController

      def email
        # Raise error is customer is already logged in
        # raise AlreadyLoggedInError.new() if session[:customer_id].present?

        customer              = Signups::EmailManager.execute(email_params)
        # session[:customer_id] = customer.id

        render json: { customer: customer }
      end

      def facebook
        # Raise error is customer is already logged in
        # raise AlreadyLoggedInError.new() if session[:customer_id].present?

        # customer              = Signups::FacebookManager.execute(facebook_params)
        # session[:customer_id] = customer.id

        # render json: { customer: customer }
      end

      def google
        # Raise error is customer is already logged in
        # raise AlreadyLoggedInError.new() if session[:customer_id].present?

        # # Get the token ID from the header
        # auth_header = request.headers['Authorization']
        # pattern     = /^Bearer /
        # token_id    = auth_header.gsub(pattern, '') if auth_header&.match(pattern)

        # customer              = Signups::GoogleManager.execute(
        #   token_id:          token_id,
        #   signup_event_code: google_params[:signup_event_code]
        # )
        # session[:customer_id] = customer.id

        # render json: { customer: customer }
      end

      private

      def email_params
        params.require(:signup).permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :birthday,
          :gender
        )
      end

      def facebook_params
        params.permit(
          :id,
          :name,
          :email,
          :access_token
        )
      end

      def google_params
        params.permit()
      end

    end
  end
end
