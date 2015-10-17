class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.top_videos(5)
    first = Skater.all.find_by_results(0)
    second = Skater.all.find_by_results(1)
    third = Skater.all.find_by_results(2)
    fourth = Skater.all.find_by_results(3)
    fifth = Skater.all.find_by_results(4)
    @skaters = [first, second, third, fourth, fifth]
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
