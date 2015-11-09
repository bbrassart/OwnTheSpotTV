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

  def set_video_attributes(metadata)
    self.html = metadata["html"]
    self.media_id = metadata["media_id"]
    self.author_name = metadata["author_name"]
    self.thumbnail_url = metadata["thumbnail_url"]
    self.thumbnail_width = metadata["thumbnail_width"]
    self.thumbnail_height = metadata["thumbnail_height"]
    self.title = metadata["title"]
    self.width = metadata["width"]
    self.author_url = metadata["author_url"]
    self.author_id = metadata["author_id"]
    self.media_type = metadata["type"]
  end

  def format_url
    new_url = url
    if new_url.include?("?")
      index = new_url.index("?")
      new_url.slice!(index...new_url.length)
    else
      new_url
    end
    if new_url.include?("https://instagram.com/p/")
      new_url.slice!("https://instagram.com/p/")
    elsif new_url.include?("http://instagram.com/p/")
      new_url.slice!("http://instagram.com/p/")
    end
    new_url
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
