module Api
    class ShareSocialMediaController < ApplicationController
        # GET /share_social_media
        def index
            @share_social_media = ShareSocialMedia.all
            render json: @share_social_media, status: :ok
        end
        # GET /share_social_media/:id
        def show
            @share_social_media = ShareSocialMedia.find_by(id: params[:id])
            
            if @share_social_media.nil?
                render json: { error: "Data not found" }, status: :not_found
            else
                render json: @share_social_media, status: :ok
            end
        end
        # POST /share_social_media
        def create
            @share_social_media = ShareSocialMedia.new(create_request)

            if @share_social_media.save
                render json: @share_social_media, status: :created
            else
                render json: @share_social_media.errors, status: :unprocessable_entity
            end
        end
        # PUT /share_social_media/:id
        def update
            @share_social_media = ShareSocialMedia.find_by(id: params[:id])
            
            if @share_social_media.nil?
                render json: { error: "Visit record not found" }, status: :not_found
            elsif @share_social_media.update(update_request)
                render json: @share_social_media, status: :ok
            else
                render json: @share_social_media.errors, status: :unprocessable_entity
            end
        end

        private

        def create_request
            params.require(:share_social_media).permit(
                :name, 
                :is_callback, 
                :callback_url
            )
        end
    
        def update_request
            params.require(:share_social_media).permit(
                :name, 
                :is_callback, 
                :callback_url
            )
        end
    end
end
