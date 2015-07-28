class Adkaters < ActiveRecord::Migration
  def change
    add_column :skaters, :stance, :string
  end
end
