module Api
    class HouseRentUnitsController < ApplicationController
        
        def index
            house_rent_units = HouseRentUnit.all
            render json: house_rent_units
        end

        def show
            house_rent_unit = HouseRentUnit.find_by(id: params[:id])
            render json: house_rent_unit
        end

        def create
            params = create_params()

            house_rent_unit = HouseRentUnit.create!(params)
            render json: house_rent_unit
        end

        def update
            house_rent_unit = HouseRentUnit.find_by(id: params[:id])
            
            params = update_params()
            house_rent_unit.update!(params)
            render json: house_rent_unit
        end

        private

        def create_params
            body_request = params.require(:house_rent_unit)
                                 .permit(
                                    :nup,
                                    :payment_status,
                                    :drop_point_status,
                                    :drop_point_paid_date,
                                    :description,
                                    :catalog_type,
                                    :cluster_type,
                                    :avaibility_status,
                                    :street_address,
                                    :price,
                                    :surface_area,
                                    :building_area
                                 ).to_h
            return body_request
          end

        def update_params
            body_request = params.require(:house_rent_unit)
                                 .permit(
                                    :nup,
                                    :payment_status,
                                    :drop_point_status,
                                    :drop_point_paid_date,
                                    :description,
                                    :catalog_type,
                                    :cluster_type,
                                    :avaibility_status,
                                    :street_address,
                                    :price,
                                    :surface_area,
                                    :building_area
                                 ).to_h
            return body_request
        end

    end
end