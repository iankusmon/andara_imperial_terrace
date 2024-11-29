module Api
  class HouseUnitsController < ApplicationController
    # Public Endpoint [index,show]
    # GET /api/house_units
    def index
      house_units = HouseUnit.all
      render json: { data: house_units }, status: :ok
    end

    # POST /api/house_units
    def create
      house_unit_params = create_request
      is_house_unit_already_exist = false

      # Validate here
      unless HouseUnit.find_by(nup: house_unit_params[:nup]).nil?
        is_house_unit_already_exist = true
      end

      if is_house_unit_already_exist == true
        render json: { error: "House Unit already exist" }, status: :bad_request
      else
        house_unit = HouseUnit.create!(house_unit_params)
        render json: house_unit, root: :house_unit, status: :ok
      end
    end

    # GET /api/house_units/:id
    def show
      house_unit = HouseUnit.find_by(id: params[:id])

      if house_unit.nil?
        render json: { error: "House Unit not found" }, status: :not_found
      else
        render json: house_unit
      end

    end

    # PUT /api/house_units/:id
    def update
      house_unit = HouseUnit.find_by(id: params[:id])

      if house_unit.nil?
        render json: { error: "House Unit not found" }, status: :not_found
      else
        house_unit.update(update_request)
        render json: house_unit, status: :ok
      end
    end

    private

    def create_request
      params.require(:house_unit).permit(
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
        :catalog_type,
        :cluster_type,
        :availability_status,
        :street_address,
        :price,
        :surface_area,
        :building_area
      )
    end

    def update_request
      params.require(:house_unit).permit(
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
        :catalog_type,
        :cluster_type,
        :availability_status,
        :street_address,
        :price,
        :surface_area,
        :building_area
      )
    end

  end
end
  