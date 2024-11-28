class CreateVisitRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :visit_records do |t|
      t.integer :page
      t.datetime :time_starts
      t.datetime :time_ends
      t.boolean :is_share
      t.integer :share_social_media_id

      t.timestamps
    end
  end
end
