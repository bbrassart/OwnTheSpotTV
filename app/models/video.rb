class Video < ActiveRecord::Base
  validates :skater_id, presence: true
  validates :spot_id, presence: true
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, length: { minimum: 26, maximum: 43}, format: /youtu/
  validates :spot_id, presence: true
  validates :category, presence: true, inclusion: { in: %w( trick line slam ) }
  belongs_to :spot
  belongs_to :skater
  has_many :votes

  def score
  	votes.inject(0) { |total, vote| total + vote.result }
  end

  def self.category_trick(category)
    where category: category
  end

  def self.latest_videos
    order('created_at DESC')
  end

  def self.top_videos(number)
    Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..number)
  end

  def self.top_5_videos_with_skater
    best_videos = Video.all.top_videos(5)
    results = best_videos.map do |video|
      [Skater.find(video.skater.id), video]
    end
  end


end
