module LocationsHelper
  # get all buses from marta api and store as a ruby array of hashes
  def fetch_buses_from_api(source_url)
    # store the entire response as a variable
    http_response = Net::HTTP.get_response(URI.parse(source_url))
    # grab the JSON object from the body of the API and saves as data
    data = http_response.body
    # render the JSON object as array of ruby hashes
    JSON.parse(data)
  end

  # return true is a bus is near a user. question mark indicates true or false method.
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    # define nearby as a max distance in degrees
    max_distance = 0.01
    # compare user location and bus location
    # difference in latitudes
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f
    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    # if it's nearby return true
    distance <= max_distance
  end
end
