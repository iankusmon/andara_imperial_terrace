# app/models/cms/homepage/section/main-banner.rb
class FacilityVideoShort < ApplicationRecord  
  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :link_url, format: URI::regexp(%w[http https]), allow_blank: true
  
end
 