class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :district
      t.boolean :visible, default: true

      t.timestamps null: false
    end
  end
end
