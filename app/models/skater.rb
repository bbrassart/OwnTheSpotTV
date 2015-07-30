class Skater < ActiveRecord::Base
  has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :videos
end
