require "./spec_helper"

describe "‚" do
  # TODO: Write tests

  # it "works" do
  #   false.should eq(true)
  # end

  it "responds" do
    result = extract_tiles_from_pois([{"lat" => 50.0, "lng" => 8.0, "zoom" => 14}])
    result.should eq({"8556_5556" => {x: 8556, y: 5556}})
  end
end
