class SiteController < ApplicationController

  def home
    @skater = Skater.new
    @best_skaters = []
    @best_skaters.push(Skater.find_by_results(0))
    @best_skaters.push(Skater.find_by_results(1))
    @best_skaters.push(Skater.find_by_results(2))
  end

end
