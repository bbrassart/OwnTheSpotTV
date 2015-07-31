class AddSlugToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :slug, :string
    add_index :spots, :slug
  end
end
