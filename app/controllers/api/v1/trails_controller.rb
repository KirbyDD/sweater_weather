class Api::V1::TrailsController < ApplicationController
  def index
    geocode = GeocodeService.new
    response = geocode.coordinates(params[:location])
    trails = TrailsService.new.trails(response)
  end
end
