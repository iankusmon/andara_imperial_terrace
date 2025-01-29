module Api
  module Admins
    module Cms
      module Homepages
        module Sections
          class MiceBannersController < ApplicationController
            def index
              banners = MiceBanner.all
              render json: banners
            end

            def show
              banner = MiceBanner.find(params[:id])
              render json: banner
            end

            def create
              banner = MiceBanner.new(banner_params)
              if banner.save
                render json: banner, status: :created
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def update
              banner = MiceBanner.find(params[:id])
              if banner.update(banner_params)
                render json: banner
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def destroy
              banner = MiceBanner.find(params[:id])
              banner.destroy
              render json: { message: 'Banner deleted successfully' }, status: :ok
            end

            private

            def banner_params
              params.require(:landmark_banner).permit(:title, :description, :image_url, :link_url)
            end
          end
        end
      end
    end
  end
end
