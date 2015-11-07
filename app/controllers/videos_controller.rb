class VideosController < ApplicationController

  def new
    @spots = Spot.all
    @video = Video.new
    render :new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @spots = Spot.all
    @video = Video.new video_params
    @video.format_url
    @video.skater_id = current_user.id
    @video.spot_id = @spot.id
    binding.pry
    if @video.save
      WelcomeMailer.user_added_video(@video).deliver_now
      redirect_to skater_path(current_user), flash: {success: "Great! Your clip is now online!"}
    else
      redirect_to new_video_path, flash: {danger: "Something went wrong... Make sure all the fields were filled"}
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params) && current_user
      redirect_to skater_path(current_user), flash: {success: 'Great!! Your video has been edited'}
    else
      render :edit
    end
  end
  def destroy
      @video = Video.find_by(id: params[:id]).try(:destroy)
      redirect_to skater_path(current_user), flash: {success: "Your clip has been successfully deleted" }
  end

  private

  def video_params
    params.require(:video).permit(:skater_id, :spot_id, :name, :url, :category, :description)
  end
end
