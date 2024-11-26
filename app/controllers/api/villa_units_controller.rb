module Api
    class VillaUnitsController < ApplicationController
  
      # GET /api/villa_units
      def index
        villa_units = VillaUnit.all
        render json: { data: villa_units }, status: :ok
      end
  
      # POST /api/villa_units
      def create
        villa_unit_params = create_request
        is_villa_unit_already_exist = false
  
        # Validate here
        unless VillaUnit.find_by(nup: villa_unit_params[:nup]).nil?
          is_villa_unit_already_exist = true
        end
  
        if is_villa_unit_already_exist == true
          render json: { error: "villa Unit already exist" }, status: :bad_request
        else
          villa_unit = VillaUnit.create!(villa_unit_params)
          render json: villa_unit, root: :villa_unit, status: :ok
        end
      end
  
      # GET /api/villa_units/:id
      def show
        villa_unit = VillaUnit.find_by(id: params[:id])
  
        if villa_unit.nil?
          render json: { error: "Villa Unit not found" }, status: :not_found
        else
          render json: villa_unit
        end
  
      end
  
      # PUT /api/villa_units/:id
      def update
        villa_unit = VillaUnit.find_by(id: params[:id])
  
        if villa_unit.nil?
          render json: { error: "Villa Unit not found" }, status: :not_found
        else
          villa_unit.update(update_request)
          render json: villa_unit, status: :ok
        end
      end
  
      private
  
      def create_request
        params.require(:villa_unit).permit(
          :nup,
          :payment_status,
          :approved_by,
          :installment_begins_at,
          :installment_ends_at,
          :drop_point_status,
          :booking_fee_status,
          :installments_paid,
          :installment_remaining,
          :drop_point_paid_date,
          :booking_fee_paid_date,
          :commision_rule_id,
          :description,
          :type,
          :floor_type,
          :availability_status,
          :street_address,
          :price,
          :surface_area,
          :building_area
        )
      end
  
      def update_request
        params.require(:villa_unit).permit(
          :nup,
          :payment_status,
          :approved_by,
          :installment_begins_at,
          :installment_ends_at,
          :drop_point_status,
          :booking_fee_status,
          :installments_paid,
          :installment_remaining,
          :drop_point_paid_date,
          :booking_fee_paid_date,
          :commision_rule_id,
          :description,
          :type,
          :floor_type,
          :availability_status,
          :street_address,
          :price,
          :surface_area,
          :building_area
        )
      end
  
    end
  end
  