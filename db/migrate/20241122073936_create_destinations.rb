class CreateDestinations < ActiveRecord::Migration[8.0]
  def change
    create_table :destinations, if_not_exists: true do |t|
      t.string :name
      t.string :description
      t.string :picture_url
      t.integer :is_active

      t.timestamps
    end
  end
end
