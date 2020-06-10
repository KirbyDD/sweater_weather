class RoadTripInfo
  attr_reader :origin, :destination, :travel_time, :forecast, :id

  def initialize(travel_info, weather)
    @id = 2
    @origin = travel_info[:start_address]
    @destination = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = get_forcast(weather)
  end

  def get_forcast(weather)
    summary = weather[:current][:weather][0][:description]
    temp = weather[:current][:temp]
    forcast = {summary: summary, temperature: temp}
  end
end
