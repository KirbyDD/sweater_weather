class RoadTripInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :travel_time, :forecast
end
