class CountriesController < ApplicationController

  def show
    @country = Country.find(params[:id])
    @gmaps_polygon = @country.polygons
  end

  def antipodes
    @country = Country.find(params[:id])
    @gmaps_polygon = @country.reversed_polygons
  end

end
