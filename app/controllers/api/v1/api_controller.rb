class Api::V1::ApiController < ApplicationController
  def spots
   spots = Spot.all
   render json: {:spots => spots}
  end

  def spot
    spot = Spot.find_by(id: params[:id])
    skaters = Skater.top_5_number_of_likes(spot.videos)
    logo_urls = []
    videos = []
    if skaters
      skaters.each do |pair|
        logo_urls.push( pair[0].logo_url )
        videos.push(pair[0].videos.length)
      end
    end
    response = {skaters: skaters,  logo_urls: logo_urls, videos: videos, spot: spot }
    render json: response
  end

  def video_leaderboard
    most_active_skaters = Skater.most_active_skaters(4)
    skaters = []
    most_active_skaters.each do |skater|
      score = 0
      skater.videos.each do |video|
        score += video.votes.sum('result')
      end
      result = [skater, score]
      skaters.push(result)
    end
    logo_urls = []
    videos = []
    skaters.each do |pair|
      logo_urls.push( pair[0].logo_url )
      videos.push(pair[0].videos.length)
    end
    response = {skaters: skaters, logo_urls: logo_urls, videos: videos}
    render json: response
  end

  def likes_leaderboard
    skaters = Skater.top_5_number_of_likes(Video.all)
    logo_urls = []
    videos = []
    skaters.each do |pair|
      logo_urls.push( pair[0].logo_url )
      videos.push(pair[0].videos.length)
    end
    response = {skaters: skaters, logo_urls: logo_urls, videos: videos}
    render json: response
  end
end
