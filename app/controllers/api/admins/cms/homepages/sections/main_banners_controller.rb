module Api
  module Admins
    module Cms
      module Homepages
        module Sections
          class MainBannersController < ApplicationController
            def index
              banners = MainBanner.all
              render json: banners.map { |banner| banner_with_image(banner) }
            end

            def show
              banner = MainBanner.find(params[:id])
              render json: banner_with_image(banner)
            end

            def create
              banner = MainBanner.new(banner_params)
              if params[:image].present?
                banner.image.attach(params[:image])
              end
              if banner.save
                render json: banner_with_image(banner), status: :created
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def update
              banner = MainBanner.find(params[:id])

              # Delete old image if a new one is being attached
              if params[:image].present? && banner.image.attached?
                banner.image.purge
              end

              if params[:image].present?
                banner.image.attach(params[:image])
              end

              if banner.update(banner_params)
                render json: banner_with_image(banner)
              else
                render json: { errors: banner.errors.full_messages }, status: :unprocessable_entity
              end
            end

            def destroy
              banner = MainBanner.find(params[:id])
              banner.destroy
              render json: { message: 'Banner deleted successfully' }, status: :ok
            end

            private

            def banner_params
              params.require(:main_banner).permit(:title, :description, :link_url)
            end

            def banner_with_image(banner)
              banner.as_json.merge({
                image_url: banner.image.attached? ? url_for(banner.image) : nil
              })
            end
          end
        end
      end
    end
  end
end
