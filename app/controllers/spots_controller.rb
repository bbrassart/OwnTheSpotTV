class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    @most_active_spots = Spot.most_active_spots
    @spots_by_district = Spot.spots_by_district
    @last_video_updated = Video.last
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
        @trick_videos = videos.category_trick('trick')
        if @trick_videos.present?
          @best_trick_videos = @trick_videos.top_videos(2)
          @best_trick_skater = Skater.find_best(@best_trick_videos)
          @latest_trick_videos = @trick_videos.latest_videos
        end
      elsif params[:category] == 'line'
        @line_videos = videos.category_trick('line')
        if @line_videos.present?
          @best_line_videos = @line_videos.top_videos(2)
          @best_line_skater = Skater.find_best(@best_line_videos)
          @latest_line_videos = @line_videos.latest_videos
        end
      elsif params[:category] == 'slam'
        @slam_videos = videos.category_trick('slam')
        if @slam_videos.present?
          @worst_slam_videos = @slam_videos.top_videos(2)
          @worst_slam_skater = Skater.find_best(@worst_slam_videos)
          @latest_slam_videos = @slam_videos.latest_videos
        end
      else
        @best_overall_videos = videos.top_videos(2)
        @overall_best_skater = Skater.find_best(@best_overall_videos)
        @latest_overall_videos = videos.latest_videos
      end
    end
  end

  def destroy
    spot = Spot.friendly.find(params[:id]).try(:destroy)
    redirect_to spots_path, flash: {success: "#{spot.name} has been removed" }
  end

  def edit
    @spot = Spot.friendly.find(params[:id])
  end

  def update
    spot = Spot.friendly.find(params[:id])
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
