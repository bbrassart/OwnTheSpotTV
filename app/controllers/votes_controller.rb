class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..5)
    @best_skater = Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0).skater_id)
  end

  def like
    @votes = Vote.all
    @vote = Vote.new
    @vote.voter_id = current_user.id
    @vote.result = 1
    @vote.video_id = params[:video_id]
    video = @vote.video
    @votes.each do |vote|
      if (current_user.id == vote.voter_id && params[:video_id] == vote.video_id)
        redirect_to spot_path(video.spot), flash: {danger: "You cannot vote twice for the same video"}
      end
    end
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
      @votes.each do |vote|
        if (current_user.id == vote.voter_id && params[:video_id] == vote.video_id)
          redirect_to spot_path(video.spot), flash: {danger: "You cannot vote twice for the same video"}
          break
        end
      end
      @vote.save
      redirect_to spot_path(video.spot), flash: {success: "Your vote has been registered!"}
    else
      redirect_to spot_path(video.spot), flash: {danger: "Oops, try to create it again please!" }
    end
  end
end
