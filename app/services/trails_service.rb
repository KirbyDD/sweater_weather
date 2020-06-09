class TrailsService

  def trails(location)
    connection = conn(location)
    search = connection.get
    trails = JSON.parse(search.body, symbolize_names: true)
    binding.pry
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
