module Api
  module V2
    # Superclass for all Application Customer Errors
    # All errors shouls inherit from this class
    class BaseError < StandardError

      # HTTP Request status code (e.g 404)
      # @return [Integer]
      attr_reader :status

      # Human readble HTTP Request status
      # Required
      # @return [String]
      attr_reader :status_name

      # Tinkerlust specific error code. Uses error class
      # @return [String]
      attr_reader :code

      # Human readble description of the error.
      attr_reader :title

      # Hash of keys that are name of offending params.
      # Follows ActiveModel::Validation.errors.messages structure
      # ### Example
      #     {
      #       order_id: [
      #         'Order does not exist',
      #         'Order does not have items'
      #       ],
      #       param_2: ['error message C for param_2']
      #     }
      # @return [Hash]
      attr_reader :messages

      # Name of the server that caused the error.
      #   - Tinkerlust
      #   - MicroServices
      #   - ThirdParty::SERVERS
      # return [String]
      attr_reader :server

      # Hash of variables with their values at the point of the error
      #
      # ### Note
      # This values **SHOULD NOT** be rendered in BaseControllers or ApplicationControllers to the client.
      # This values are to be rendered to the developer using the current Error Notification (GChat)
      #
      # ### Example
      #     {
      #       order_id: 1,
      #       customer_id: 2,
      #       var_3: 'value for var_3'
      #     }
      #
      # @return [Hash] hash of variables and values
      attr_reader :debug_values

      # @param [Hash] messages optional parameter if no validation class used. Defaults to {}
      # @param [Hash] debug_values optional parameter if no debug_values exists/required. Defaults to {}
      # @param [Hash] options optional parameter for attributes other than messages and debug_values. Typically for status
      def initialize(messages: {}, debug_values: {}, **options)
        super
        @code          = options[:code] || self.class.name
        @title         = title || options[:title] || 'Oops... Something went wrong.'
        @server        = server || options[:server] || 'Tinkerlust'
        @messages      = messages
        @debug_values  = debug_values
      end

    end
  end
end
