module Api
  module Customers
    module Signups
      # Creates a Customer
      # Sends confirmation mailer
      class EmailManager

        def self.execute(params = {})
          validator = EmailValidator.new(params)
          # raise SignupError.new(messages: validator.errors.messages) unless validator.valid?

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
end
