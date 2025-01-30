module Api
  module Admins
    class ArticlesController < ApplicationController
      # Private Endpoint
      # GET /admins/cms_articles
      def index
          filter_params = index_request
          cms_articles = ::Cms::Article.all
          cms_articles = cms_articles.where('title LIKE ?', "%#{filter_params[:title]}%") if filter_params[:title].present?
          cms_articles = cms_articles.where('url LIKE ?', "%#{filter_params[:url]}%") if filter_params[:url].present?
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
          cms_article = ::Cms::Article.find_by(id: params[:id])

          if cms_article.nil?
          render json: { error: "Article not found" }, status: :not_found
          else
          render json: cms_article, status: :ok
          end
      end
      
      # POST /admins/cms_articles
      def create
          cms_article_params = create_request
          @cms_article = ::Cms::Article.new(cms_article_params)

          # Set image_type berdasarkan title (maks 15 karakter)
          image_type = params[:cms_article][:title][0..15]

          # Attach hero image jika tersedia dan simpan URL
          attach_hero_image(@cms_article, params[:cms_article][:hero_image], image_type)

          # Attach section images jika tersedia dan simpan URL
          attach_section_images(@cms_article, params[:cms_article][:sections_attributes], image_type)

          if @cms_article.save
            render json: @cms_article, status: :created
          else
            render json: { errors: @cms_article.errors.full_messages }, status: :unprocessable_entity
          end

          # ::Cms::Notifiers::BlogPostsSendBatchJob.perform_async({ blog_post_id: blog_post.id }.stringify_keys)
      end
      
      # PUT /admins/cms_articles/:id
      def update
        cms_article_params = create_request
        @cms_article = ::Cms::Article.find(params[:id])

        # Set image_type berdasarkan title (maks 15 karakter)
        image_type = params[:cms_article][:title][0..15]
    
        # Hapus hero image lama, attach image baru, dan simpan URL
        attach_hero_image(@cms_article, params[:cms_article][:hero_image], image_type)
    
        # Hapus section image lama, attach image baru, dan simpan URL
        attach_section_images(@cms_article, params[:cms_article][:sections_attributes], image_type)
    
        if @cms_article.update(cms_article_params)
          render json: @cms_article
        else
          render json: { errors: @cms_article.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def index_request
        params.permit(
            :title,
            :active_status,
            :category,
            :url
          )
      end

      def create_request
          params.require(:cms_article).permit(
            :title,
            :summary,
            :introduction,
            :closing,
            :hero_image,
            :url,
            :active_status,
            :category,
            :published_at,
            :is_deleted,
            sections_attributes: [[
              :id,
              :title,
              :description
            ]],
            meta_data_attributes: [
              :id,
              :title,
              :keyword,
              :description
            ]
          )
      end

      def update_request
          params.require(:cms_article).permit(
            :title,
            :summary,
            :introduction,
            :closing,
            :hero_image,
            :url,
            :active_status,
            :category,
            :published_at,
            :is_deleted,
            sections_attributes: [[
              :id,
              :title,
              :description
            ]],
            meta_data_attributes: [
              :id,
              :title,
              :keyword,
              :description
            ]
          )
      end

      # Method untuk attach hero image dan simpan URL
      def attach_hero_image(article, hero_image, image_type)
        return unless hero_image.present?

        # Hapus hero image lama jika ada
        article.hero_image.purge if article.hero_image.attached?

        # Attach hero image baru
        article.hero_image.attach(io: hero_image, filename: "#{image_type}_hero_image.jpg", content_type: hero_image.content_type)

        # Simpan URL hero image ke dalam hero_image_url
        article.hero_img_url = url_for(article.hero_image) if article.hero_image.attached?
      end

      # Method untuk attach section images dan simpan URL
      def attach_section_images(article, sections, image_type)
        return unless sections.present?

        sections.each do |section_params|
          next unless section_params[:image].present?

          section = article.sections.find_by(id: section_params[:id])

          # Jika section ada, hapus image lama dan attach image baru
          if section
            section.image.purge if section.image.attached?
            section.image.attach(io: section_params[:image], filename: "#{image_type}_section_#{section.id}.jpg", content_type: section_params[:image].content_type)

            # Simpan URL section image ke dalam section_image_url
            section.update(image_url: url_for(section.image)) if section.image.attached?
          end
        end
      end
              
    end
  end
end
