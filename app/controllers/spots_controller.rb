class SpotsController < ApplicationController

  def index
    @spots = Spot.all
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
    @spot = Spot.find(params[:id])
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
