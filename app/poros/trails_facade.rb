class TrailsFacade
  attr_reader :id
  def initialize(trails)
    @id = 1
    @trails = trails
  end

  def forecast
    @trails[0].get_forecast
  end

  def trails
    @trails
  end
end
