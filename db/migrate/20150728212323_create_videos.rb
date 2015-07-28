class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :skater_id
      t.integer :spot_id
      t.string :name
      t.string :url
      t.string :category
      t.text :description

      t.timestamps null: false
    end
  end
end
