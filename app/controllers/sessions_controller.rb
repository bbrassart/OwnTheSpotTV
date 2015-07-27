class SessionsController < ApplicationController

  def new
    @skater = Skater.new
  end

  def create
    skater = Skater.find_by_username(params[:username])
    if skater && skater.authenticate(params[:username])
      session[:user_id] = skater.id

      redirect_to skaters_path, :flash => {success: 'Welcome Home #{skater.username}' }
    else
  # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', :flash => {error: 'Oops, something went wrong! Try again please'}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
