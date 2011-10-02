require 'spec_helper'

describe "routes an address" do
	it "routes to the correct controller" do
		{ :get => "/geocode?q=test" }.
			should route_to(
				:controller => "places",
				:action => "geocode"
		)
	end
end
