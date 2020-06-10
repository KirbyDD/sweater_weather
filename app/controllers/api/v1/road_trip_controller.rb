class Api::V1::RoadTripController < ApplicationController
  def create
    unless User.find_by(api_key: params[:api_key])
      render json: {error: "Valid API Key Required"}, status: 401
    else
      travel_info = TravelService.new.get_travel_info(params[:origin], params[:destination])
      lat = travel_info[:end_location][:lat]
      lng = travel_info[:end_location][:lng]
      weather = WeatherService.new.get_weather({lat: lat, lng: lng})
      road_trip_info = RoadTripInfo.new(travel_info, weather)
      render json: RoadTripInfoSerializer.new(road_trip_info), status: 201
    end
  end
end
