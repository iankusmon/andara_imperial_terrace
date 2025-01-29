class CreateCmsHomepageSectionAgentAffiliateBanner < ActiveRecord::Migration[8.0]
  def up
    create_table :agent_affiliate_banners do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :link_url

      t.timestamps
    end
  end

  def down
    drop_table :agent_affiliate_banners
  end
end
