# TODO: Write documentation for `Slippy`
require "kemal"
require "slippy_tiles"
require "json"

# module Slippy
#   VERSION = "0.1.0"
# end

def extract_tiles_from_pois(pois : Array(Hash(String, Float64)), zoom : UInt8)
  tile_collection = Hash(String, NamedTuple(x: UInt32, y: UInt32)).new
  pois.each do |poi|
    tile = SlippyTiles.get_tile_number(poi["lat"].as(Float64), poi["lng"].as(Float64), zoom.to_u8)
    tile_collection["#{tile[:x]}_#{tile[:y]}"] = {x: tile[:x].to_u32, y: tile[:y].to_u32}
  end
  tile_collection
end

# The request content type needs to be application/json
# The payload
# {"pois": ["{lat: 50.0, lng: 8.0, zoom: 14}"]}
post "/json_params" do |env|
  pois = env.params.json["pois"].as(Array)
  zoom = env.params.json["zoom"].as(Int64)
  puts typeof(zoom)
  results = Array(Hash(String, Float64)).new
  if pois.is_a?(Array)
    pois.each do |poi|
      results << {"lat" => poi["lat"].as_f, "lng" => poi["lng"].as_f}
    end
  end
  {zoom: zoom, result: extract_tiles_from_pois(results, zoom.to_u8).values}.to_json  
end

Kemal.run
