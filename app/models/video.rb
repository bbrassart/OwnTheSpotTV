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

  def ajax_call(unique_id)
    api_url = "http://api.instagram.com/oembed/?url=".concat(unique_id)
    conn = Faraday.new(:url => api_url) do |faraday|
      faraday.response :json            # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get, {hidecaption: 'true'}
    response
  end

  def set_video_attributes(video, metadata)
    video.html = metadata["html"]
    video.media_id = metadata["media_id"]
    video.author_name = metadata["author_name"]
    video.thumbnail_url = metadata["thumbnail_url"]
    video.thumbnail_width = metadata["thumbnail_width"]
    video.thumbnail_height = metadata["thumbnail_height"]
    video.title = metadata["title"]
    video.width = metadata["width"]
    video.author_url = metadata["author_url"]
    video.author_id = metadata["author_id"]
    video.media_type = metadata["type"]
    video.save
  end

  def format_url
    if url.include?("?taken-by=") || url.include?("?tagged-by")
      index = url.index("?")
      unique_id = url.slice(index...url.length)
    end
    if unique_id.include?("https://instagram.com/p/")
      unique_id.slice!("https://instagram.com/p/")
    elsif unique_id.include?("http://instagram.com/p/")
      unique_id.slice!("http://instagram.com/p/")
    end
    unique_id
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
