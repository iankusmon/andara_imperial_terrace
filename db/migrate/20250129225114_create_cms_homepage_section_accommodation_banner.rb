class CreateCmsHomepageSectionAccommodationBanner < ActiveRecord::Migration[8.0]
  def change
    create_table :accommodation_banners do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :link_url

      t.timestamps
    end
  end
end
