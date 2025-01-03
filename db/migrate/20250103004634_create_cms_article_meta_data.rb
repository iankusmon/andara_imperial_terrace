class CreateCmsArticleMetaData < ActiveRecord::Migration[5.1]
  def change
    create_table :cms_article_meta_data do |t|
      t.references :cms_article, foreign_key: { to_table: :cms_articles }, index: true
      t.text :title
      t.text :keyword
      t.text :description
      t.timestamps
    end
  end
end
