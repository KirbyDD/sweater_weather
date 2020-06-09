class MapquestService
  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def get_distance
    response = conn.get
    @time = JSON.parse(response.body, symbolize_names: true)[:route][:distance]
  end

  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/directions/v2/route") do |f|
      f.params["key"] = "#{ENV['MAPQUEST_KEY']}"
      f.params["from"] = @start
      f.params["to"] = @finish
    end
  end
end
