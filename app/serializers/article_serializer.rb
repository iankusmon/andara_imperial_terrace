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
end
