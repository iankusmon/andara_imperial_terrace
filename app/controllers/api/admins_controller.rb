module Api
  class AdminsController < ApplicationController
    # Private Endpoint
    # GET /api/admins
    def index
      admins = Admin.all 
      render json: { data: admins }, status: :ok
    end

    # POST /api/admins
    def create
      admin_params = create_request

      # Validasi jika admin sudah ada
      if Admin.find_by(id: admin_params[:id])
        render json: { error: "This Admin already exists" }, status: :bad_request
      else
        admin = Admin.create!(admin_params)
        render json: { data: admin }, status: :created
      end
    end

    # GET /api/admins/:id
    def show
      admin = Admin.find_by(id: params[:id])

      if admin
        render json: { data: admin }, status: :ok
      else
        render json: { error: "Admin not found" }, status: :not_found
      end
    end

    # PUT /api/admins/:id
    def update
      admin = Admin.find_by(id: params[:id])

      if admin
        if admin.update(update_request)
          render json: { data: admin }, status: :ok
        else
          render json: { error: admin.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Admin not found" }, status: :not_found
      end
    end

    private

    def create_request
      params.require(:admin).permit(
        :name,
        :username,
        :email,
        :mobile,
        :last_login_at,
        :roles,
        :password,
        :password_digest,
        :photo_profil_url
      )
    end

    def update_request
      params.require(:admin).permit(
        :name,
        :username,
        :email,
        :mobile,
        :last_login_at,
        :roles,
        :password,
        :password_digest,
        :photo_profil_url
      )
    end
  end
end
