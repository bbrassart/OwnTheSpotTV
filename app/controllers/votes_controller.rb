class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..3)
    @best_skater = Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0).skater_id)
  end

  def like
    @vote = Vote.new
    @vote.voter_id = current_user.id
    @vote.result = 1
    @vote.video_id = params[:video_id]
    video = @vote.video
    if @vote.valid?
      @vote.save
      redirect_to spot_path(video.spot), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(video.spot), flash: {danger: "Oops, try to create it again please!" }
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
