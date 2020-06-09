class Api::V1::TrailsController < ApplicationController
  def index
    geocode = GeocodeService.new
    response = geocode.coordinates(params[:location])
    trails = TrailsService.new.trails(response, params[:location])  
    render json: TrailsSerializer.new(TrailsFacade.new(trails))
  end
end
