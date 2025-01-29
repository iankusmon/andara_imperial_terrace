class CreateCmsHomepageSectionWisataModernBanner < ActiveRecord::Migration[8.0]
  def uo
    create_table :wisate_modern_banners do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :link_url

      t.timestamps
    end
  end

  def down
    drop_table :wisate_modern_banners
  end
end
