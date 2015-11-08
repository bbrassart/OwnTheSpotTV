class AddMediaTypeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :media_type, :string
  end
end
