class SiteController < ApplicationController

  def home
    @skater = Skater.new
    @skaters = Skater.top_5_number_of_likes(Video.all)
  end

end
