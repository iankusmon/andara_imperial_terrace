module Api
  module Admins
    class SignUpsController < ApplicationController
      
      # Sign Up Admin by e-mail
      def email
        admin = Admin.new(email_request)

        if admin.save
          render json: { message: 'Admin created successfully', admin: admin }, status: :created
        else
          render json: { message: 'Failed to create admin', errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private


      def email_request
        params.require(:admin).permit(
          :name, 
          :email, 
          :username, 
          :mobile,
          :roles,
          :password, 
          :password_confirmation, 
          :photo_profile_url
        )
      end

    end
  end
end
