module Api
  class VisitRecordsController < ApplicationController
    # Private Endpoint
    # GET /visit_records
    def index
        @visit_records = VisitRecord.all
        render json: @visit_records, status: :ok
    end
    # GET /visit_records/:id
    def show
        @visit_record = VisitRecord.find_by(id: params[:id])
        
        if @visit_record.nil?
            render json: { error: "Visit record not found" }, status: :not_found
        else
            render json: @visit_record, status: :ok
        end
    end
    # POST /visit_records
    def create
        @visit_record = VisitRecord.new(create_request)
        
        if @visit_record.save
            render json: @visit_record, status: :created
        else
            render json: @visit_record.errors, status: :unprocessable_entity
        end
    end
    # PUT /visit_records/:id
    def update
        @visit_record = VisitRecord.find_by(id: params[:id])
        
        if @visit_record.nil?
            render json: { error: "Visit record not found" }, status: :not_found
        elsif @visit_record.update(update_request)
            render json: @visit_record, status: :ok
        else
            render json: @visit_record.errors, status: :unprocessable_entity
        end
    end

    private
    
    def create_request
        params.require(:visit_record).permit(
            :page, 
            :time_starts, 
            :time_ends, 
            :is_share, 
            :share_social_media_id
        )
    end

    def update_request
        params.require(:visit_record).permit(
            :page, 
            :time_starts, 
            :time_ends, 
            :is_share, 
            :share_social_media_id
        )
    end    
  end
end

