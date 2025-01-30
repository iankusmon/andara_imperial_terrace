class CreateFacilityVideoShort < ActiveRecord::Migration[8.0]
  def up
    create_table :facility_video_shorts do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :link_url

      t.timestamps
    end
  end

  def down
    drop_table :facility_video_shorts
  end
end
