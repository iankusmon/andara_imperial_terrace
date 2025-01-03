module Cms
  class Article
    class MetaData < ApplicationRecord

      belongs_to :cms_article, class_name: '::Cms::Article', foreign_key: 'cms_article_id', inverse_of: :meta_data, optional: true

    end
  end
end
