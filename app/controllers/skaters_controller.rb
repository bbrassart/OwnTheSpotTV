class SkatersController < ApplicationController

  def index
    @skaters = Skater.all
    @most_active_skaters = Skater.most_active_skaters(2)
    @last_video_updated = Video.last
  end

  def new
    @skater = Skater.new
  end

  def create
    @skater = Skater.new(skater_params)
    if @skater.save
      session[:user_id] = @skater.id
      flash[:success] = "Hi #{@skater.username}! Welcome to OwnTheSpot.TV!"
      begin
        WelcomeMailer.welcome_email(@skater).deliver_now
      rescue
        puts 'Another email issue'
      ensure
        if bypass_instagram_auth?
          redirect_to skater_path(@skater)
        else
          redirect_to instagram_auth_path
        end
      end
    else
      redirect_to root_path, flash: {danger: "Something went wrong... Make sure all the fields were filled" }
    end
  end

  def show
    @videos = Video.all
    @skater = Skater.friendly.find(params[:id])
    @skater_likes = Skater.friendly.find(params[:id]).videos.reduce(0) {|sum, video| sum + video.score}
  end

  def destroy
    current_user.try(:destroy)
    redirect_to skaters_path, flash: {success: "How sad is that! #{current_user.username}'s profile has been deleted" }
    session.clear
  end

  def edit
    @skater = Skater.friendly.find(params[:id])
  end

  def update
    skater = Skater.friendly.find(params[:skater][:id])
    if skater.update_attributes skater_params
      redirect_to skaters_path, flash: {success: "Congrats #{skater.username}! Your new information has been saved." }
    else
      render :edit
    end
  end

  private

  def skater_params
    params.require(:skater).permit(:username, :email, :password, :password_confirmation, :logo, :stance)
  end

end
