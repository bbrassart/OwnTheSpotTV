class Api::V1::SpotsController < ApplicationController
  def get_all
   spots = Spot.all
   render json: {:spots => spots}
  end
end
