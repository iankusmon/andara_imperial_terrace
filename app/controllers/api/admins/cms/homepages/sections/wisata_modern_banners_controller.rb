module Api
  module Admins
    module Cms
      module Homepages
        module Sections
          class WisataModernBannersController < ApplicationController
            def index
              banners = WisataModernBanner.all
              render json: banners
            end

            def show
              banner = WisataModernBanner.find(params[:id])
              render json: banner
            end

            def create
              banner = WisataModernBanner.new(banner_params)
              if banner.save
                render json: banner, status: :created
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def update
              banner = WisataModernBanner.find(params[:id])
              if banner.update(banner_params)
                render json: banner
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def destroy
              banner = WisataModernBanner.find(params[:id])
              banner.destroy
              render json: { message: 'Banner deleted successfully' }, status: :ok
            end

            private

            def banner_params
              params.require(:wisata_modern_banner).permit(:title, :description, :image_url, :link_url)
            end
          end
        end
      end
    end
  end
end
