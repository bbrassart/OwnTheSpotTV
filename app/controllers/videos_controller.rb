class VideosController < ApplicationController

  def new
    @spots = Spot.all
    @video = Video.new
    render :new
  end

  def process_api_call(video)
    unique_id = "http://instagr.am/p/".concat(video.format_url)
    api_url = "http://api.instagram.com/oembed/?url=".concat(unique_id)
    conn = Faraday.new(:url => api_url) do |faraday|
      faraday.response :json            # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get, {hidecaption: 'true'}
    set_video_attributes(video, response[0].body)
  end

  def set_video_attributes(video, metadata)
    video.html = metadata["html"]
    video.media_id = metadata["media_id"]
    video.author_name = metadata["author_name"]
    video.thumbnail_url = metadata["thumbnail_url"]
    video.thumbnail_width = metadata["thumbnail_width"]
    video.thumbnail_height = metadata["thumbnail_height"]
    video.title = metadata["title"]
    video.width = metadata["width"]
    video.author_url = metadata["author_url"]
    video.author_id = metadata["author_id"]
    video.media_type = metadata["type"]
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @spots = Spot.all
    @video = Video.new video_params
    @video.skater_id = current_user.id
    @video.spot_id = @spot.id
    if @video.valid?
      process_api_call(@video)
      @video.save!
      binding.pry
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
    params.require(:video).permit(:skater_id, :spot_id, :url, :category)
  end
end
