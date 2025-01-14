module Api
  module Admins
    class VillaUnitKavlingsController < ::Api::BaseController
      # before_action :authenticate_admin

      # GET /villa_unit_kavlings
      def index
        filter_params = index_request
        villa_unit_kavlings = VillaUnitKavling.all
        villa_unit_kavlings = villa_unit_kavlings.where(kavling_type: filter_params[:kavling_type]) if filter_params[:kavling_type].present?
        villa_unit_kavlings = villa_unit_kavlings.where(availability_status: filter_params[:availability_status]) if filter_params[:availability_status].present?
        villa_unit_kavlings = villa_unit_kavlings.where(payment_status: filter_params[:payment_status]) if filter_params[:payment_status].present?

        render(
          json: villa_unit_kavlings,
          root: :villa_unit_kavlings,
          each_serializer: VillaUnitKavlingSerializer
        )
      end

      # GET /villa_unit_kavlings/:id
      def show
        villa_unit_kavling = VillaUnitKavling.find_by(id: params[:id])

        if villa_unit_kavling.nil?
          render json: { error: "Villa Unit Kavling not found" }, status: :not_found
        else
          render json: villa_unit_kavling, status: :ok
        end
      end

      # POST /villa_unit_kavling_kavlings
      def create
        villa_unit_kavling_params = create_request
        villa_unit_kavling = VillaUnitKavling.new(villa_unit_kavling_params)

        if villa_unit_kavling.save
          render json: villa_unit_kavling, status: :created
        else
          render json: { errors: villa_unit_kavling.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /villa_unit_kavling_kavlings/:id
      def update
        villa_unit_kavling = VillaUnitKavling.find_by(id: params[:id])
        update_params = update_request

        if villa_unit_kavling.nil?
          render json: { error: "Villa Unit Kavling not found" }, status: :not_found
        else
          if villa_unit_kavling.update(update_params)
            render json: villa_unit_kavling, status: :ok
          else
            render json: { errors: villa_unit_kavling.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end

      private

      def create_request
        params.require(:villa_unit_kavling).permit(
          :kavling_id, 
          :nup_id, 
          :booking_fee_id, 
          :down_payment_id, 
          :pelunasan_id, 
          :approved_by, 
          :description, 
          :payment_status, 
          :kavling_type, 
          :availability_status, 
          :street_address, 
          :price, 
          :surface_area, 
          :building_area
        )
      end

      def update_request
        params.require(:villa_unit_kavling).permit(
          :kavling_id, 
          :nup_id, 
          :booking_fee_id, 
          :down_payment_id, 
          :pelunasan_id, 
          :approved_by, 
          :description, 
          :payment_status, 
          :kavling_type, 
          :availability_status, 
          :street_address, 
          :price, 
          :surface_area, 
          :building_area
        )
      end

      def index_request
        params.permit(
          :street_address, 
          :kavling_type, 
          :availability_status, 
          :payment_status
        )
      end
    end
  end
end
