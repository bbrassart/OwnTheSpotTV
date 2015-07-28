class Spot < ActiveRecord::Base
  has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :visible, presence: true
end
