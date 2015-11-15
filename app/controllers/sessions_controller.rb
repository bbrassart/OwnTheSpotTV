class SessionsController < ApplicationController

  def new
    @skater = Skater.new
  end

  def create
    skater = Skater.find_by_username(params[:username])
    if skater && skater.authenticate(params[:password])
      session[:user_id] = skater.id
      redirect_to spots_path, :flash => {success: "Welcome Home #{skater.username}" }
    else
  # If user's login doesn't work, send them back to the login form.
      redirect_to root_path, :flash => {danger: "Oops... Something went wrong..."}
    end
  end

  def destroy
    name = current_user.username
    session[:user_id] = nil
    redirect_to root_path, :flash => {success: "Bye #{name}! See you soon!"}
  end

end
