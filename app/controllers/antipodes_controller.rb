class AntipodesController < ApplicationController

  def show
    # Please enter an address yada yada.
    @random_example = ["Ushuaia",
      "Jakarta, Indonesia",
      "Bogota",
      "Wellington, New Zealand",
      "Madrid"].sample
  end

  def address
    geocoding_result = Geocoder.search(params[:q]).first
    if geocoding_result.nil?
      flash[:error] = "Looks like I can't find this place. Could you try to be more precise?"
      redirect_to '/'
    else
      @lat = geocoding_result.latitude
      @lng = geocoding_result.longitude
      @json = '[{"lng":"'+@lng.to_s+'", "lat":"'+@lat.to_s+'"}]'
    end
  end

  def reverse
    # Get the coordinates back from the form
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    # Compute the antipodes
    lng = if lng<0 then lng+180 else lng-180 end
    lat = -lat
    @json = '[{"lng":"'+lng.to_s+'", "lat":"'+lat.to_s+'"}]'
    reverse_geocoding_result = Geocoder.search(lat.to_s+","+lng.to_s)
    @reverse_address = if reverse_geocoding_result.empty?
                         "No address found."
                       else
                         reverse_geocoding_result.first.address
                       end
  end

end


