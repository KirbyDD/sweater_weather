class Trail
  attr_reader :name, :summary, :difficulty, :location, :distance
  def initialize(trail_obj, start)
    @lat = trail_obj[:latitude]
    @long = trail_obj[:longitude]
    @name = trail_obj[:name]
    @summary = trail_obj[:summary]
    @difficulty = trail_obj[:difficulty]
    @location = trail_obj[:location]
    @distance = distance(start, trail_obj[:location])
  end

  def get_forecast
  response = WeatherService.new.get_weather({lat: @lat, lng: @long})
  summary = response[:current][:weather][0][:description]
  temp = response[:current][:temp]
  forcast = {summary: summary, temperature: temp}
  end

  def distance(start, location)
    MapquestService.new(start, location).get_distance
  end
end
