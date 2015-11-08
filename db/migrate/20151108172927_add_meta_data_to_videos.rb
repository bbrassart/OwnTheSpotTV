class AddMetaDataToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :html, :string
    add_column :videos, :media_id, :string
    add_column :videos, :author_name, :string
    add_column :videos, :thumbnail_url, :string
    add_column :videos, :thumbnail_width, :string
    add_column :videos, :thumbnail_height, :string
    add_column :videos, :title, :string
    add_column :videos, :width, :string
    add_column :videos, :author_url, :string
    add_column :videos, :author_id, :string
    add_column :videos, :type, :string
  end
end
