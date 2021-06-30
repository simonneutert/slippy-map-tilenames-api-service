require "./spec_helper"

describe "Microservice JSON endpoint" do
  # You can use get,post,put,patch,delete to call the corresponding route.
  it "renders /" do
    json_body = {
      "zoom": 14,
      "pois": [
        {
          "lat": 50.0,
          "lng": 8.0,
        },
        {
          "lat": 50.0,
          "lng": 7.0,
        },
        {
          "lat": 51.0,
          "lng": 8.0,
        },
        {
          "lat": 49.0,
          "lng": 7.0,
        },
        {
          "lat": 49.0,
          "lng": 7.0,
        },
        {
          "lat": 49.0,
          "lng": 7.0,
        },
      ],
    }
    post("/geopoints", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: json_body.to_json)
    response.body.should eq %({"zoom":14,"result":[{"x":8556,"y":5556},{"x":8510,"y":5556},{"x":8556,"y":5484},{"x":8510,"y":5626}]})
  end
end

describe "slippy" do
  # TODO: Write tests

  it "responds" do
    result = extract_tiles_from_pois([{"lat" => 50.0, "lng" => 8.0}], 14)
    result.should eq({"8556_5556" => {x: 8556, y: 5556}})
  end
end
