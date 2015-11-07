class Skater < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_attached_file :logo, styles: {medium: "300x300", big: "1920x1080", thumb: "100x100", landscape: "280x150"}
  validates_attachment_content_type :logo, presence: true, :content_type => /\Aimage\/.*\z/
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :videos, dependent: :destroy
  has_many :votes

  def self.most_active_skaters
    includes(:videos).sort { |x,y| x.videos.length <=> y.videos.length }.reverse.slice(0..2)
  end

  def self.find_best(videos)
    includes(:videos).find_by_id(videos.slice(0).skater_id)
  end

  def self.top_5_number_of_likes
    ordered_videos = Video.all.top_videos(5)
    results = ordered_videos.each_with_object({}) do |video, hash|
      if hash[video.skater.id]
        hash[video.skater.id] += video.score
      else
        hash[video.skater.id] = video.score
      end
    end
    top_5_skaters = results.sort_by {|_key, value| value}.reverse.slice(0..4).each do |pair|
      pair[0] = Skater.find(pair[0])
    end
  end
end
