module Api
    class AdminsController < ApplicationController
  
      # GET /api/admins
      def index
        admins = Admins.all
        render json: { data: admins }, status: :ok
      end
  
      # POST /api/admins
      def create
        admins_params = create_request
        is_admin_already_exist = false
  
        # Validate here
        unless Admins.find_by(nup: admin_params[:nup]).nil?
          is_admin_already_exist = true
        end
  
        if is_admin_already_exist == true
          render json: { error: "House Unit already exist" }, status: :bad_request
        else
          admin = Admin.create!(admin_params)
          render json: admin, root: :admin, status: :ok
        end
      end
  
      # GET /api/admins/:id
      def show
        admin = Admin.find_by(id: params[:id])
  
        if admin.nil?
          render json: { error: "House Unit not found" }, status: :not_found
        else
          render json: admin
        end
  
      end
  
      # PUT /api/admins/:id
      def update
        admin = Admin.find_by(id: params[:id])
  
        if admin.nil?
          render json: { error: "House Unit not found" }, status: :not_found
        else
          admin.update(update_request)
          render json: admin, status: :ok
        end
      end
  
      private
  
      def create_request
        params.require(:admin).permit(
          :name,
          :email,
          :created_at,
          :upadate_at,
          :last_login_at,
          :roles
        )
      end
  
      def update_request
        params.require(:admin).permit(
          :name,
          :email,
          :created_at,
          :upadate_at,
          :last_login_at,
          :roles
        )
      end
  
    end
  end
  