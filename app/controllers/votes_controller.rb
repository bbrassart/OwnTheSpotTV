class VotesController < ApplicationController
  def new
    @spot = Spot.find_by(params[:id])
    @videos = Video.all
  end

  def new
    @spot = Spot.find_by(params[:id])
    @videos = Video.all
  end

  def like
    @spot = Spot.find(params[:id])
    @videos = Video.all
    @vote = Vote.new vote_params
    @vote.voter_id = current_user.id
    @vote.spot_id = @spot.id
    @vote.result += 1
    if @vote.valid?
      @vote.save
      redirect_to spot_path(:id), flash: {success: "Your vote has been registered!"}
    else
      render :new, flash: {danger: "Oops, try to create it again please!" }
    end
  end

  def dislike
    @spot = Spot.find(params[:id])
    @videos = Video.all
    @vote = Vote.new vote_params
    @vote.voter_id = current_user.id
    @vote.spot_id = @spot.id
    @vote.result -= 1
    if @vote.valid?
      @vote.save
      redirect_to spot_path(:id), flash: {success: "Your vote has been registered!"}
    else
      render :new, flash: {danger: "Oops, try to create it again please!" }
    end
  end
end
