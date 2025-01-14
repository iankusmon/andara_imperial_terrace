class ChangeActiveStatusTypeInCmsArticles < ActiveRecord::Migration[8.0]
  def change
    change_column :cms_articles, :active_status, :integer
  end
end
