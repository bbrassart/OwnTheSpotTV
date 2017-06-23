class VotesController < ApplicationController

  def index
    @highest_rated_videos =  Video.all.top_5_videos_with_skater
    @skaters = Skater.top_5_number_of_likes(Video.all)
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

  def report_poser
    @video = Video.find(params[:video_id])
    @skater = current_user
    begin
      WelcomeMailer.poser_button(@video, @skater).deliver_now
    rescue
      puts 'Another email issue'
    ensure
      redirect_to spot_path(@video.spot_id), flash: {success: "Thank you for helping us!"}
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
