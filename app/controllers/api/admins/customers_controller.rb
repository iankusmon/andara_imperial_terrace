module Api
  module Admins
    class CustomersController < ::Api::BaseController
      # before_action :authenticate_admin
      
      # GET /customers
      def index
          filter_params = index_request
          customers = Customer.all
          customers = customers.where('name LIKE ?', "%#{filter_params[:name]}%") if filter_params[:name].present?
          customers = customers.where('username LIKE ?', "%#{filter_params[:username]}%") if filter_params[:username].present?
          customers = customers.where('email LIKE ?', "%#{filter_params[:email]}%") if filter_params[:email].present?
          customers = customers.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          customers = customers.where("mobile LIKE ?", "%#{filter_params[:mobile]}%") if filter_params[:mobile].present?
          customers = customers.where(roles: filter_params[:roles]) if filter_params[:roles].present?
          customers = customers.where(is_deleted: filter_params[:is_deleted]) if filter_params[:is_deleted].present?
          
          render(
            json: customers,
            root: :customers,
            each_serializer: CustomerSerializer
          )
      end
      
      # GET /customers/:id
      def show
          customer = Customer.find_by(id: params[:id])

          if customer.nil?
          render json: { error: "Customer not found" }, status: :not_found
          else
          render json: customer, status: :ok
          end
      end
      
      # POST /customers
      def create
          customer_params = create_request
          #Validasi jika customer sudah ada
          if Customer.find_by(email: customer_params[:email])
            render json: { error: "Email Customer Sudah Terdaftar" }, status: :unprocessable_entity
          elsif Customer.find_by(username: customer_params[:username])
            render json: { error: "Username Customer Sudah Terdaftar" }, status: :unprocessable_entity
          elsif Customer.find_by(name: customer_params[:name])
            render json: { error: "Nama Customer Sudah Terdaftar" }, status: :unprocessable_entity
          elsif Customer.find_by(mobile: "0#{customer_params[:mobile]}")
            render json: { error: "Nomor Handphone Sudah Terdaftar" }, status: :unprocessable_entity
          elsif Customer.find_by(nik: customer_params[:nik])
            render json: { error: "NIK Sudah Terdaftar" }, status: :unprocessable_entity
          else
            customer = Customer.create!(customer_params)
            render json: customer, status: :ok
          end
      end
      
      # PUT /customers/:id
      def update
          customer = Customer.find_by(id: params[:id])
          update_params = update_request


          if customer.nil?
          render json: { error: "Customer not found" }, status: :not_found
          else
          customer.update!(update_params)
          render json: customer, status: :ok
          end
      end

      private

      def create_request
          params.require(:customer).permit(
              :name, 
              :email, 
              :username, 
              :mobile, 
              :referreral_code, 
              :visit_id, 
              :kpr_document_id, 
              :villa_unit_id, 
              :last_login_at, 
              :villa_rent_id, 
              :package_id, 
              :created_at, 
              :updated_at, 
              :is_buyer, 
              :is_renter, 
              :is_package, 
              :is_package_buyer, 
              :password, 
              :password_digest, 
              :photo_profile_url, 
              :customer_address_id,
              :nik,
              :roles,
              :is_deleted
          )
      end

      def update_request
          params.require(:customer).permit(
              :name, 
              :email, 
              :username, 
              :mobile, 
              :referreral_code, 
              :visit_id, 
              :kpr_document_id, 
              :villa_unit_id, 
              :last_login_at, 
              :villa_rent_id, 
              :package_id, 
              :created_at, 
              :updated_at, 
              :is_buyer, 
              :is_renter, 
              :is_package, 
              :is_package_buyer, 
              :password, 
              :password_digest, 
              :photo_profile_url, 
              :customer_address_id,
              :nik,
              :roles,
              :is_deleted
          )
      end

      def index_request
        params.permit(
              :name, 
              :username, 
              :email, 
              :mobile, 
              :nik,
              :roles,
              :is_deleted
          )
      end
            
    end
  end
end
