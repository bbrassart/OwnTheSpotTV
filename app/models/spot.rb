class Spot < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100", :square => "200x200"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :visible, presence: true
  has_many :videos

  def self.most_active_spots
    Spot.all.sort_by{|spot| spot.videos.count}.reverse.slice(0..2)
  end

  def self.spots_by_district
    Spot.all.sort_by{ |spot| spot.district }
  end
end
