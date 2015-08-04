class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    @most_active_spots = Spot.all.sort_by{|spot| spot.videos.count}.reverse.slice(0..2)
    @spots_by_district = Spot.all.sort_by{ |spot| spot.district }
    @current_district = ""
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    if spot.save
      redirect_to spots_path, flash: {success: "The spot #{spot.name} has been created!" }
    else
      render :new, flash: {danger: "Oops, try to create it again please" }
    end
  end

  def show
    @spot = Spot.friendly.find(params[:id])
    videos = @spot.videos
    if videos.present?
      if params[:category] == 'trick'
        @trick_videos = videos.where category: 'trick'
        if @trick_videos.present?
          @best_trick_videos = @trick_videos.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..2)
          @best_trick_skater = Skater.find_by_id(@best_trick_videos.slice(0).skater_id)
          @latest_trick_videos = @trick_videos.order('created_at DESC')
        end
      elsif params[:category] == 'line'
        @line_videos = videos.where category: 'line'
        if @line_videos.present?
          @best_line_videos = @line_videos.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..2)
          @best_line_skater = Skater.find_by_id(@best_line_videos.slice(0).skater_id)
          @latest_line_videos = @line_videos.order('created_at DESC')
        end
      elsif params[:category] == 'slam'
        @slam_videos = videos.where category: 'slam'
        if @slam_videos.present?
          @worst_slam_videos = @slam_videos.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..2)
          @worst_slam_skater = Skater.find_by_id(@worst_slam_videos.slice(0).skater_id)
          @latest_slam_videos = @slam_videos.order('created_at DESC')
        end
      else
        @best_overall_videos = videos.sort_by {|video| video.votes.sum('result')}.reverse.slice(0..2)
        @overall_best_skater = Skater.find_by_id(@best_overall_videos.slice(0).skater_id)
        @latest_overall_videos = videos.order('created_at DESC')
      end
    end
  end

  def destroy
    spot = Spot.find_by(params[:id]).try(:destroy)
    redirect_to spots_path, flash: {success: "#{spot.name} has been removed" }
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    if spot.update_attributes(spot_params)
      redirect_to spots_path, flash: {success: "#{spot.name} has been updated." }
    else
      render :edit
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :district, :visible, :logo)
  end

end
