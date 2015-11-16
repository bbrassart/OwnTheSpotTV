class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.top_5_videos_with_skater
    @skaters = Skater.top_5_number_of_likes(Video.all)

    if params[:spot]
      @spot = Spot.find_by_name(params[:spot])
      @skaters_for_spot = Skater.top_5_number_of_likes(@spot.videos)
      @list_of_spots = Spot.all

    elsif params[:type] == "likes"
      @skaters = Skater.top_5_number_of_likes

    elsif params[:type] == "spots"
      @spots = Spot.all

    elsif params[:type] == "videos"
      @skaters_by_videos = Skater.most_active_skaters
    end
  end

  def like
    @votes = Vote.all
    @video = Video.find(params[:video_id])
    @vote = Vote.new
    @vote.voter_id = current_user.id
    @vote.result = 1
    @vote.video_id = @video.id
    if @vote.voter_id == @video.skater_id
      redirect_to spot_path(@video.spot_id), flash: {danger: "Oops... Your vote couldn't be saved" }
    elsif @vote.valid?
      @vote.save
      redirect_to spot_path(@video.spot_id), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(@video.spot_id), flash: {danger: "Oops... Your vote couldn't be saved" }
    end
  end

  def dislike
    @vote = Vote.new
    @video = Video.find(params[:video_id])
    @vote.voter_id = current_user.id
    @vote.result = -1
    @vote.video_id = @video.id
    if @vote.voter_id == @video.skater_id
      redirect_to spot_path(@video.spot_id), flash: {danger: "Oops... Your vote couldn't be saved" }
    elsif @vote.valid?
      @vote.save
      redirect_to spot_path(@video.spot_id), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(@video.spot_id), flash: {danger: "Oops... Your vote couldn't be saved" }
    end
  end
end
