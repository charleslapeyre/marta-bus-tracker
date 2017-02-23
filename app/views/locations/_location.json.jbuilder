json.extract! location, :id, :street_addess, :city, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
