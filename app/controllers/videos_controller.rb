class VideosController < ApplicationController

  def new
    @spots = Spot.all
    @video = Video.new
    render :new
  end

  def links
    api_url = "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{current_user.access_token}"
    conn = Faraday.new(:url => api_url) do |faraday|
      faraday.response :json            # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get, {hidecaption: 'true'}
    markup = ""
    response[0].body["data"].each do |media|
      if media["type"] == "video"
        markup += "<div class=section><li>#{media["caption"]["text"]}</li><li><a href=#{media["link"]} target=_blank>#{media["link"]}</a></li><br>
        <video controls>
        <source src=#{media["videos"]["low_resolution"]["url"]}>
        </video></div>"
      end
    end
    if markup == ""
      markup += "<div class=section><h5>Sorry, you didn´t submit any clips recently</h5></div>"
    end
    @markup =  markup.concat("</ul><br>")
  end

  def process_api_call(video)
    unique_id = "http://instagr.am/p/".concat(video.format_url)
    response = video.ajax_call(unique_id)
    video.set_video_attributes(response[0].body)
  end

  def authorize_media(video, api_url, skater)
    response = video.check_authenticity(api_url)

     if image_error(response, video, skater)
       flash[:danger] = "Either you don't owe the media or it's not a clip... Sorry!"
       redirect_to(:action => "new") and return
     else
       WelcomeMailer.user_added_video(video).deliver_now
       flash[:success] = "Great! Your clip is now online!"
       redirect_to skater_path(@skater) and return
     end
  end

  def image_error(response, video, skater)
    unless response[0].body["data"]["type"] == "video" && response[0].body["data"]["user"]["id"] == skater.insta_id
      video.destroy
      true
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @spots = Spot.all
    @video = Video.new video_params
    @video.skater_id = current_user.id
    @skater = Skater.find(@video.skater_id)
    @video.spot_id = @spot.id
    if @video.valid?
      @video.save
      process_api_call(@video)
      api_url = "https://api.instagram.com/v1/media/#{@video.media_id}?access_token=#{@skater.access_token}"
      authorize_media(@video, api_url, @skater)
    else
      flash[:danger] = "Either you already uploaded this clip or it's not a proper Instagram URL... Sorry!"
      redirect_to(:action => "new") and return
    end
  end

  def edit
    @spots = Spot.all
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
