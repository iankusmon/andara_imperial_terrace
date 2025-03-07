module Cms
  class Article
    class Section < ApplicationRecord
      has_one_attached :image

      belongs_to :cms_article, class_name: '::Cms::Article', foreign_key: 'cms_article_id', inverse_of: :sections, optional: true

    end
  end
end
