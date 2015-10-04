class PlacesController < ApplicationController

  def index
    # Please enter an address yada yada.
    @random_example = ["Ushuaia",
      "Jakarta, Indonesia",
      "Bogota",
      "Wellington, New Zealand",
      "Madrid"].sample
  end

  def geocode
    geocoding_result = Geocoder.search(params[:q]).first
    if geocoding_result.nil?
      flash[:error] = t(:cant_find_location)
      redirect_to '/'
    else
      @lat = geocoding_result.latitude
      @lng = geocoding_result.longitude
      @gmaps_markers = Gmaps4rails.build_markers([""]) do |_,marker|
        marker.lat @lat
        marker.lng @lng
      end
    end
  end

  def antipodes
    # Get the coordinates back from the form
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    # Compute the antipodes
    lng = if lng<0 then lng+180 else lng-180 end
    lat = -lat
    @gmaps_markers = Gmaps4rails.build_markers([""]) do |_,marker|
      marker.lat lat
      marker.lng lng
    end
    reverse_geocoding_result = Geocoder.search(lat.to_s+","+lng.to_s)
    @reverse_address = if reverse_geocoding_result.empty?
                         t :address_not_found
                       else
                         reverse_geocoding_result.first.address
                       end
  end

end


