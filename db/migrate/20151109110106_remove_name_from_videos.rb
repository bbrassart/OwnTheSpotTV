class RemoveNameFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :name
  end
end
