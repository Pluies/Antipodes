require 'spec_helper'

describe AntipodesController do

  it "should render the index page" do
    get :show
    response.should render_template("show")
  end

  it "should render address" do
    get :address, :q => "test"
    response.should render_template("address")
  end

  it "should not render en empty request" do
    get :address, :q => ""
    response.should_not render_template("address")
    response.should redirect_to("/")
  end

end
