require 'instagram'
class InstagramsController < ApplicationController
  CALLBACK_URL = "http://ownthespot.tv/oauth/callback"

  def redirection
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    current_user.update_columns(
      access_token: response.access_token
    )
    current_user.get_user_info
    redirect_to spots_path
  end
end
