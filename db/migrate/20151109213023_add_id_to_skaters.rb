class AddIdToSkaters < ActiveRecord::Migration
  def change
    add_column :skaters, :insta_id, :string
  end
end
