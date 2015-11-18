class Api::V1::ApiController < ApplicationController
  def spots
   spots = Spot.all
   render json: {:spots => spots}
  end

  def spot
    spot = Spot.find_by(name: params[:name])
    videos = Skater.top_5_number_of_likes(spot.videos)
    logo_urls = []
    videos.each do |pair|
      logo_urls.push( pair[0].avatar_url )
    end
    response = {spot: spot, videos: videos, logo_urls: logo_urls}
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
    logo_urls = []
    skaters_by_videos.each do |pair|
      logo_urls.push( pair[0].logo_url )
    end
    response = {skaters_by_videos: skaters_by_videos, logo_urls: logo_urls}
    render json: response
  end

  def likes_leaderboard
    skaters = Skater.top_5_number_of_likes(Video.all)
    logo_urls = []
    skaters.each do |pair|
      logo_urls.push( pair[0].logo_url )
    end
    response = {skaters: skaters, logo_urls: logo_urls}
    render json: response
  end

end
