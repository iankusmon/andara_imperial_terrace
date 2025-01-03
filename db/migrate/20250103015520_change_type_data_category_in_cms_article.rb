class ChangeTypeDataCategoryInCmsArticle < ActiveRecord::Migration[8.0]
  def change
    change_column :cms_articles, :category, :integer, null: false
  end
end
