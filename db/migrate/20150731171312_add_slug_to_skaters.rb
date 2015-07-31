class AddSlugToSkaters < ActiveRecord::Migration
  def change
    add_column :skaters, :slug, :string
    add_index :skaters, :slug
  end
end
