class TrailsSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :forecast, :trails
end
