class SiteController < ApplicationController
  def home
    @skater = Skater.new
  end
end
