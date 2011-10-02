require 'spec_helper'

describe CountriesController do

  it "should show a country" do
    get :show, :id => Country.first.id
    response.should render_template("show")
  end

  it "should show the antipodes of a country" do
    get :antipodes, :id => Country.first.id
    response.should render_template("antipodes")
  end

end

