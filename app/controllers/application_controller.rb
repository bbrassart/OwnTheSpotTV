class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    #session[:user_id] = nil
    @current_user ||= Skater.find(session[:user_id]) if session[:user_id]
  end


  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
