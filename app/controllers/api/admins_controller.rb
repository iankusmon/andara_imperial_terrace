module Api
  class AdminsController < ::Api::BaseController
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_admin

    # include Metadata

    # GET /api/admins
    def index
      admins = Admin.all 
      render(
        json: admins,
        root: :admins,
        # meta: paagination_dict(admins),
        each_serializer: ::AdminSerializer
      )
    end

    def profile
      render json: current_admin, status: :ok
    end

    # POST /api/admins
    def create
      admin_params = create_request
      # Validasi jika admin sudah ada
      if Admin.find_by(email: admin_params[:email])
        render json: { error: "Email Admin Sudah Terdaftar" }, status: :unprocessable_entity
      elsif Admin.find_by(username: admin_params[:username])
        render json: { error: "Username Admin Sudah Terdaftar" }, status: :unprocessable_entity
      elsif Admin.find_by(name: admin_params[:name])
        render json: { error: "Nama Admin Sudah Terdaftar" }, status: :unprocessable_entity
      elsif Admin.find_by(mobile: "0#{admin_params[:mobile]}")
        render json: { error: "Nomor Handphone Sudah Terdaftar" }, status: :unprocessable_entity
      elsif current_admin&.roles == "super_admin"
        render json: { error: "Hanya Super Admin Dapat Membuat Akun Admin" }, status: :unprocessable_entity
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

    def logout
      # authentication_admin
      # if current_admin
      #   current_admin.update(auth_token: nil)
      #   render json: { message: 'Logout successful' }, status: :ok
      # end
      reset_session
      set_csrf_cookie()

      render json: { status: :ok }
    end

    private

    def create_request
      params.require(:admin).permit(
        :name,
        :username,
        :email,
        :mobile,
        :roles,
        :password,
        :password_confirmation,
        :photo_profil_url,
        :active_status
      )
    end

    def update_request
      params.require(:admin).permit(
        :name,
        :username,
        :email,
        :mobile,
        :roles,
        :password,
        :password_confirmation,
        :photo_profil_url,
        :active_status
      )
    end
  end
end
