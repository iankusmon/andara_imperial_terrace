# app/models/cms/homepage/section/main-banner.rb
class WisataModernBanner < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :link_url, format: URI::regexp(%w[http https]), allow_blank: true
  validates :image, presence: true

  # After image is attached, store its URL
  after_save :store_image_url

  private

  def store_image_url
    # Save the image URL to the database after attaching the image
    if image.attached?
      self.image_url = Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
      save
    end
  end
  
end
 