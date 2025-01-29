
include Rails.application.routes.url_helpers

class ArticleSerializer < ActiveModel::Serializer
  attributes  :id,
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

              def hero_img_url
                Rails.application.routes.url_helpers.url_for(object.hero_image)
              end

              has_one :meta_data
              has_many :sections, serializer: ArticleSectionSerializer

end
