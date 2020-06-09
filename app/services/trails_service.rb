class TrailsService

  def trails(location, start)
    connection = conn(location)
    search = connection.get
    response = JSON.parse(search.body, symbolize_names: true)[:trails]
    trails = response.map do |trail_obj|
      Trail.new(trail_obj, start)
    end
  end

  private

  def conn(location)
    Faraday.new(url: 'https://www.hikingproject.com/data/get-trails') do |f|
      f.params["key"] = "#{ENV['TRAILS_KEY']}"
      f.params["lat"] = location[:lat]
      f.params["lon"] = location[:lng]
    end
  end
end
