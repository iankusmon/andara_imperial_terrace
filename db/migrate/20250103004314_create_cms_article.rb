class CreateCmsArticle < ActiveRecord::Migration[5.1]
  def up
    create_table :cms_articles do |t|
      t.string :title, null: false
      t.text :summary
      t.text :introduction
      t.text :closing
      t.string :hero_img_url
      t.string :url, null: false
      t.string :active_status
      t.string :category, null: false
      t.datetime :published_at
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end 

  end

  def down
    drop_table :cms_articles
  end

end
