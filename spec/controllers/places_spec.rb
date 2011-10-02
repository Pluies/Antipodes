require 'spec_helper'

describe PlacesController do

  it "should render the index page" do
    get :index
    response.should render_template("index")
  end

  it "should render address" do
    get :geocode, :q => "test"
    response.should render_template("geocode")
  end

  it "should not render en empty request" do
    get :geocode, :q => ""
    response.should_not render_template("geocode")
    response.should redirect_to("/")
  end

end
