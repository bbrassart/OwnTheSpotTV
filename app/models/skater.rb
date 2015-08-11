class Skater < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :videos, dependent: :destroy
  has_many :votes
end
