class SiteController < ApplicationController

  def home
    @skater = Skater.new
    @best_skaters = []
    @best_skaters.push(Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(0).skater_id))
    @best_skaters.push(Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(1).skater_id))
    @best_skaters.push(Skater.find_by_id(Video.all.sort_by {|video| video.votes.sum('result')}.reverse.slice(2).skater_id))
  end

  def rules
  end

  def about
  end

  def contact
  end

end
