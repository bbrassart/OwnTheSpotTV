class Api::V1::ApiController < ApplicationController
  def spots
   spots = Spot.all
   render json: {:spots => spots}
  end

  def spot
    spot = Spot.find_by(name: params[:name])
    videos = Skater.top_5_number_of_likes(spot.videos)
    response = {spot: spot, videos: videos}
    render json: response
  end

  def video_leaderboard
    most_active_skaters = Skater.most_active_skaters(4)
    skaters_by_videos = []
    most_active_skaters.each do |skater|
      score = 0
      skater.videos.each do |video|
        score += video.votes.sum('result')
      end
      result = [skater, score]
      skaters_by_videos.push(result)
    end
    render json: skaters_by_videos
  end

  def likes_leaderboard
    skaters = Skater.top_5_number_of_likes(Video.all)
    render json: skaters
  end

end
