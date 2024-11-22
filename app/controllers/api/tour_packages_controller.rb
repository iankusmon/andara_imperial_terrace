module Api
    class TourPackagesController < ApplicationController
        
        def index
            tour_packages = TourPackage.all
            render json: tour_packages
        end

        def show
            tour_package = TourPackage.find_by(id: params[:id])
            render json: tour_package
        end

        def create
            params = create_params()

            tour_package = TourPackage.create!(params)
            render json: tour_package
        end

        def update
            tour_package = TourPackage.find_by(id: params[:id])
            
            params = update_params()
            tour_package.update!(params)
            render json: tour_package
        end

        private

        def create_params
            body_request = params.require(:tour_package)
                                 .permit(
                                    :name,
                                    :price,
                                    :payment_status,
                                    :drop_point_status,
                                    :destination_ids,
                                    :is_stay,
                                    :tour_days
                                 ).to_h
            return body_request
          end

        def update_params
            body_request = params.require(:tour_package)
                                 .permit(
                                    :name,
                                    :price,
                                    :payment_status,
                                    :drop_point_status,
                                    :destination_ids,
                                    :is_stay,
                                    :tour_days
                                 ).to_h
            return body_request
        end

    end
end
