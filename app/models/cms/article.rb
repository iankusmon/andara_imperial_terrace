module Cms
  class Article < ApplicationRecord

    has_many :sections, class_name: 'Cms::Article::Section', foreign_key: 'cms_article_id', inverse_of: :cms_article
    has_one :meta_data, class_name: 'Cms::Article::MetaData', foreign_key: 'cms_article_id', inverse_of: :cms_article

    accepts_nested_attributes_for :sections
    accepts_nested_attributes_for :meta_data

    enum :active_status, {
      disabled: 0, 
      enabled: 1, 
      
    }

    # Convert \n separated paragraphs of summary into array of summary
    # 'PARAGRAPH 1'
    #
    # 'PARAGRAPH 2'
    # => ['PARAGRAPH 1', 'PARAGRAPH 2']
    def detach_summary
      paragraphed_summary = summary
      return paragraphed_summary unless paragraphed_summary

      return paragraphed_summary.tr('[]', '').split('\n')
    end

    # # Convert category separated commas into array of categories
    # # 'fashion, lifesteal' => ['fashion', 'lifesteal']
    def detach_categories
      return category.tr('[]', '').split(',')
    end

  end
end
