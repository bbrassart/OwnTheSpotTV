require 'instagram'
class InstagramsController < ApplicationController


  def redirection
    redirect_to Instagram.authorize_url(:redirect_uri => "http://ownthespot.tv/oauth/callback")
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => "http://ownthespot.tv/oauth/callback")
    current_user.update_columns(
      access_token: response.access_token
    )
    current_user.get_user_info
    redirect_to spots_path
  end
end
