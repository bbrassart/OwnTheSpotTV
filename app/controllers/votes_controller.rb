class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..5)
    first_skater = Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0).skater_id)
    second_skater = Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(1).skater_id)
    third_skater = Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(2).skater_id)
    @skaters = [first_skater, second_skater, third_skater]
  end

  def like
    @votes = Vote.all
    @vote = Vote.new
    @vote.voter_id = current_user.id
    @vote.result = 1
    @vote.video_id = params[:video_id]
    video = @vote.video
    if @vote.valid?
      @vote.save
      redirect_to spot_path(video.spot), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(video.spot), flash: {danger: "You cannot vote twice for the same video" }
    end
  end

  def dislike
    @vote = Vote.new
    @vote.voter_id = current_user.id
    @vote.result = -1
    @vote.video_id = params[:video_id]
    video = @vote.video
    if @vote.valid?
      @vote.save
      redirect_to spot_path(video.spot), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(video.spot), flash: {danger: "Oops, try to create it again please!" }
    end
  end
end
