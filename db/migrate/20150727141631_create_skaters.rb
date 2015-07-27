class CreateSkaters < ActiveRecord::Migration
  def change
    create_table :skaters do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
