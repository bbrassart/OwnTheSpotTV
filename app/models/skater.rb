class Skater < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_attached_file :logo, styles: {medium: "300x300", thumb: "100x100", landscape: "280x150"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :videos, dependent: :destroy
  has_many :votes


  def self.most_active_skaters
    Skater.all.sort_by{|skater| skater.videos.count}.reverse.slice(0..2)
  end

  def self.find_by_results(position)
    Skater.all.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(position).skater_id)
  end

  def self.find_best(videos)
    Skater.find_by_id(videos.slice(0).skater_id)
  end
end
