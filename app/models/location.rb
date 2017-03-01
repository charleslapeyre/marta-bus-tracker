class Location < ApplicationRecord
  geocoded_by :full_street_address
  after_validation :geocode

  # use constant in your model to relay a group of values that will never change
  # MARTA_CITIES = []

  def full_street_address
    "#{street_address}, #{city}, GA"
  end
end
