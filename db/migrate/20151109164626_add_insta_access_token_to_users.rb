class AddInstaAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :skaters, :access_token, :string
  end
end
