class GeocodeService
  def coordinates(location)
    city = location.split(',')[0].downcase
    state = location.split(',')[1].downcase
    response = conn.get("json?address=#{city},+#{state}")
    body = JSON.parse(response.body, symbolize_names: true)
    body[:results][0][:geometry][:location]
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/') do |faraday|
      faraday.params["key"] = "#{ENV['GOOGLE_API_KEY']}"
    end
  end
end
