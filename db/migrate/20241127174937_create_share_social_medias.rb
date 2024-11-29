class CreateShareSocialMedias < ActiveRecord::Migration[8.0]
  def up
    create_table :share_social_media do |t|
      t.integer :name
      t.boolean :is_callback
      t.string :callback_url

      t.timestamps
    end
  end

  def down
    drop_table :share_social_media
  end

end
