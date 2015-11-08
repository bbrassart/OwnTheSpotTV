class RemoveTypeColumn < ActiveRecord::Migration
  def change
    remove_column :videos, :type
  end
end
