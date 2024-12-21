module Api
  module Customers
    # Raised when validating customer during signup process
    class UnauthorizedError < Api::Customers::BaseError

      def initialize(params = {})
        # REQUIRED attributes
        @status_name = :unauthorized
        @status = Rack::Utils::SYMBOL_TO_STATUS_CODE[@status_name]

        # OPTIONAL attributes to be set
        # BaseError will set default values if no params passed from validator
        # - title: defaults to 'Oops... Something went wrong.'
        # - server: defaults to 'Tinkerlust'
        # - messages: defaults to []
        @title = 'Please log in again. We logged you out to protect your acccount.'

        @skip_sentry = true

        # super will call BaseError's initialize method
        # to set default values.
        super
      end

    end
  end
end
