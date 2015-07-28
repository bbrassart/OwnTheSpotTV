class Adters < ActiveRecord::Migration
  def self.up
    add_attachment :skaters, :logo
  end

  def self.down
    remove_attachment :skaters, :logo
  end
end
