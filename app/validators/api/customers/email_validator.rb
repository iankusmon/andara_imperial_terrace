module Api
  module Customers
    module Signups
      # Validates params when signing up via email
      # - non social login
      class EmailValidator

        include ActiveModel::Validations

        attr_reader :name,
                    :email,
                    :password,
                    :password_confirmation,
                    :birthday,
                    :gender

        validates_presence_of :name, message: 'Name cannot be empty'
        validates_presence_of :email, message: 'Email cannot be empty'
        validates_presence_of :gender, message: 'Gender cannot be empty'
        validates_presence_of :password, message: 'Password cannot be empty'
        validates_presence_of :password_confirmation, message: 'Password Confirmation cannot be empty'

        validates :email, 'valid_email_2/email': {
          disposable:             true,
          disallow_subaddressing: true,
          message:                'We are unable to verify your email. Please try a different email addres.'
        }

        validate :password_match?, if: -> { @password.present? && @password_confirmation.present? }
        validate :email_unique?, if: -> { @email.present? }
        validate :name_valid?, if: -> { @name.present? }
        validate :birthday_valid?, if: -> { @birthday.present? }
        validate :age_valid?, if: -> { @birthday.present? && @is_birthday_valid == true }
        validate :gender_valid?, if: -> { @gender.present? }

        def initialize(params)
          @name = params[:name]
          @email = params[:email]
          @password = params[:password]
          @password_confirmation = params[:password_confirmation]
          @birthday = params[:birthday]
          @is_birthday_valid = false
          @gender = params[:gender]
        end

        private

        def password_match?
          return if @password == @password_confirmation

          errors.add(
            :password,
            'Password and Password Confirmation does not match'
          )
        end

        def email_unique?
          return unless ::Customer.where(email: @email).exists?

          errors.add(
            :email,
            'Email is already registered.'
          )
        end

        def name_valid?
          return if @name.match(/\A[a-zA-Z][a-zA-Z\. ]*\z/)

          errors.add(
            :name,
            'Name must only consists of alphabets'
          )
        end

        def birthday_valid?
          birthday = DateTime.parse(@birthday)
          if birthday.is_a?(DateTime)
            @is_birthday_valid = true
            return
          end

          errors.add(
            :birthday,
            'Birthday is not a valid datetime format'
          )
        end

        def age_valid?
          birthday = DateTime.parse(@birthday)
          birthday_year = birthday.year
          return if DateTime.now.year - birthday_year >= 15

          errors.add(
            :birthday,
            'You need to be 15 and older to sign up at Tinkerlust'
          )
        end

        def gender_valid?
          return if ::Customer.genders[gender].present?

          errors.add(
            :gender,
            'Gender is invalid.'
          )
        end

      end
    end
  end
end
