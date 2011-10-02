class Country < ActiveRecord::Base
  def antipodes(lat, lng)
    return [-lat, (lng>0) ? lng-180 : lng+180 ]
  end
  def reversed_polygons
    polygons.gsub /{"lng": (.*?), "lat": (.*?)}/ do |match|
      lng = $1.to_f
      lat = $2.to_f
      new_lat, new_lng = antipodes(lat, lng)
      '{"lng": '+new_lng.to_s+', "lat": '+new_lat.to_s+'}'
    end
  end
end
