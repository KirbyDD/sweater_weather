class TravelService
  def get_travel_info(start, destination)
    request = conn.get('/maps/api/directions/json?') do |r|
      r.params['origin'] = start
      r.params['destination'] = destination
      r.params['units'] = 'imperial'
      r.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(request.body, symbolize_names: true)
    json[:routes][0][:legs][0]
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com')
  end
end
