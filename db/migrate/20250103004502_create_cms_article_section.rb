class CreateCmsArticleSection < ActiveRecord::Migration[5.1]
  def change
    create_table :cms_article_sections do |t|
      t.references :cms_article, foreign_key: { to_table: :cms_articles }, index: true
      t.text :title
      t.string :image_url
      t.text :description
      t.timestamps
    end
  end
end
