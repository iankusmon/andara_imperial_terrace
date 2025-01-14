module Api
  module Admins
    class ArticlesController < ApplicationController
      # Private Endpoint
      # GET /admins/cms_articles
      def index
          filter_params = index_request
          cms_articles = Cms::Article.all
          cms_articles = cms_articles.where('title LIKE ?', "%#{filter_params[:title]}%") if filter_params[:title].present?
          cms_articles = cms_articles.where(active_status: filter_params[:active_status]) if filter_params[:active_status].present?
          cms_articles = cms_articles.where(category: filter_params[:category]) if filter_params[:category].present?
          render(
            json: cms_articles,
            root: :cms_articles,
            each_serializer: ArticleSerializer
          )
      end
      
      # GET /admins/cms_articles/:id
      def show
          cms_article = Cms::Article.find_by(id: params[:id])

          if cms_article.nil?
          render json: { error: "Article not found" }, status: :not_found
          else
          render json: cms_article, status: :ok
          end
      end
      
      # POST /admins/cms_articles
      def create
          cms_article_params = create_request

          # Check whether cms_article already exist, by checking unique cms_article number
          if Cms::Article.find_by(title: cms_article_params[:title])
          render json: { error: "This Cms::Article already exists" }, status: :bad_request
          else
          cms_article = Cms::Article.create!(cms_article_params)
          render json: cms_article, status: :ok
          end
      end
      
      # PUT /admins/cms_articles/:id
      def update
          cms_article = Cms::Article.find_by(id: params[:id])
          update_params = update_request

          # Check whether cms_article exist
          if cms_article.nil?
          render json: { error: "Cms::Article not found" }, status: :not_found
          else
          cms_article.update!(update_params)
          render json: cms_article, status: :ok
          end
      end

      private

      def index_request
        params.permit(
            :title,
            :active_status,
            :category
          )
      end

      def create_request
          params.require(:cms_article).permit(
            :title,
            :summary,
            :introduction,
            :closing,
            :hero_img_url,
            :url,
            :active_status,
            :category,
            :published_at,
            :is_deleted
          )
      end

      def update_request
          params.require(:cms_article).permit(
            :title,
            :summary,
            :introduction,
            :closing,
            :hero_img_url,
            :url,
            :active_status,
            :category,
            :published_at,
            :is_deleted
          )
      end
            
    end
  end
end
