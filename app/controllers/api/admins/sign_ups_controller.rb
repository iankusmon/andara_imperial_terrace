module Api
  module Admins
    class SignUpsController < ApplicationController
      before_action :authentication_admin

      def create
        unless current_admin&.super_admin?
          return render json: { message: 'Unauthorized: Only super admin can create new admins' }, status: :forbidden
        end

        admin = Admin.new(admin_params)
        if admin.save
          render json: { message: 'Admin created successfully', admin: admin }, status: :created
        else
          render json: { message: 'Failed to create admin', errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      # Define the admin_params method correctly
      def admin_params
        params.require(:admin).permit(:name, :email, :username, :mobile, :roles, :password, :password_confirmation, :photo_profil_url )
      end
    end
  end
end

