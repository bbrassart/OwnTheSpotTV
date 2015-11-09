class Video < ActiveRecord::Base
  validates :skater_id, presence: true
  validates :spot_id, presence: true
  validates :url, presence: true, uniqueness: true, length: { maximum: 90}, format: /instagram/
  validates :spot_id, presence: true
  validates :category, presence: true, inclusion: { in: %w( trick line slam ) }
  belongs_to :spot
  belongs_to :skater
  has_many :votes

  def score
  	votes.inject(0) { |total, vote| total + vote.result }
  end

  def format_url
    if url.include?("?taken-by=") || url.include?("?tagged-by")
      index = url.index("?")
      url.slice!(index...url.length)
    end
    if url.include?("https://instagram.com/p/")
      url.slice!("https://instagram.com/p/")
    elsif url.include?("http://instagram.com/p/")
      url.slice!("http://instagram.com/p/")
    end
    url
  end

  def self.category_trick(category)
    where category: category
  end

  def self.latest_videos
    order('created_at DESC')
  end

  def self.top_videos(number)
    includes(:votes).sort_by {|video| video.votes.sum('result')}.reverse.slice(0..number)
  end

  def self.top_5_videos_with_skater
    best_videos = Video.top_videos(5)
    results = best_videos.map do |video|
      [Skater.find(video.skater.id), video]
    end
  end
end
