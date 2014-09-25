require "rails_helper"

describe "default router" do
  it "default router" do
    expect(get("/")).
        to route_to("calculator#index")
  end
end

describe "calc router" do
  it "calc router" do
    expect(get("/calc")).
        to route_to("calculator#index")
  end
end

describe "route for calculating" do
  it "calculating" do
    expect(post("/calc/calculate")).
        to route_to("calculator#calculate")
  end
end