class SkatersController < ApplicationController

  def index
    @skaters = Skater.all
    @most_active_skaters = Skater.most_active_skaters
    @last_video_updated = Video.last
  end

  def new
    @skater = Skater.new
  end

  def create
    @skater = Skater.new(skater_params)
    binding.pry
    if @skater.save
      WelcomeMailer.welcome_email(@skater).deliver_now
      session[:user_id] = @skater.id
      redirect_to skaters_path, flash: {success: "Hi #{current_user.username}! Welcome to OwnTheSpot.TV!" }

    else
      redirect_to root_path, flash: {danger: "Oops, try to register again please" }
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
    @skater = current_user
  end

  def update
    if current_user.update_attributes(skater_params)
      redirect_to skaters_path, flash: {success: "Congrats #{current_user.username}! Your new information has been saved." }
    else
      render :edit
    end
  end

  private

  def skater_params
    params.require(:skater).permit(:username, :email, :password, :password_confirmation, :logo, :stance)
  end

end
