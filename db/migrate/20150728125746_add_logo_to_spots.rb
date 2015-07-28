class AddLogoToSpots < ActiveRecord::Migration
  def self.up
    add_attachment :spots, :logo
  end

  def self.down
    add_attachment :spots, :logo
  end
end
