class SkatersController < ApplicationController

  def index
    @skaters = Skater.all
  end

  def new
    @skater = Skater.new
  end

  def create
    skater = Skater.new(skater_params)
    if skater.save
      session[:user_id] = skater.id
      redirect_to skaters_path, :flash => { :success => "Welcome to OwnTheSpot.TV!" }
    else
      redirect_to new_skater_path, :flash => { :error => "Oops, try to register again please" }
    end
  end

  private

  def skater_params
    params.require(:skater).permit(:username, :email, :password, :password_confirmation)
  end

end
