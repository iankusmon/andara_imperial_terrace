module Api
  module Customers
      # Creates a Customer
      # Sends confirmation mailer for Signing Up
      class EmailManager

        def self.execute(params = {})
          validator = EmailValidator.new(params)
        
          if validator.invalid?
            raise ::Api::Customers::UnprocessableEntityError.new(
              title:          'Unable to Sign Up',
              messages:       validator.errors.messages,
              debug_values: {
                name:         params[:name],
                email:        params[:email],
                birthday:     params[:birthday],
                gender:       params[:gender],
              }
            )
          end

          # Create customer with identity
          # Leaves out provider_id since we need the customer's id first
          customer = ::Customer.create!(
            name:                  params[:name],
            email:                 params[:email],
            birthday:              params[:birthday],
            gender:                params[:gender],
            password:              params[:password],
            password_confirmation: params[:password_confirmation]            
          )

          ##
          # Send email for confirmation token
          # ConfirmationMailer.new(customer).send()

          return customer
        end

      end
  end
end
