require 'geokit-rails' # needs to be after the geokit gem is loaded

# These defaults are used in Geokit::Mappable.distance_to and in acts_as_mappable
Geokit::default_units = :miles
Geokit::default_formula = :sphere

# This is the timeout value in seconds to be used for calls to the geocoder web
# services.  For no timeout at all, comment out the setting.  The timeout unit
# is in seconds.
Geokit::Geocoders::request_timeout = 10

case Rails.env
  when "production"
    Geokit::Geocoders::google = "ABQIAAAAh_s4OGDep6rhobqF8HHTkhSB5CorcNYgUtvjXpGtvHKyPLOkFxT77wM_qgbngq6af46Ftpwx-6xmiA"
  when "staging"
    Geokit::Geocoders::google = "ABQIAAAAh_s4OGDep6rhobqF8HHTkhTOO_pOSifMpxy4A43BvgdF3iFTGxThszlZatbKB1xGk-tuA8mY2m8k1g"
  when "test"
    Geokit::Geocoders::google = "ABQIAAAAmjJFbzoDiZ8-G2lCFX1mzBT-FO7D8bKoU98il3yOdxvGvxaLBhR6L7uRQk-c5aOiUgZwUhByVKoFgQ"
  when "development"
    Geokit::Geocoders::google = "ABQIAAAAmjJFbzoDiZ8-G2lCFX1mzBT-FO7D8bKoU98il3yOdxvGvxaLBhR6L7uRQk-c5aOiUgZwUhByVKoFgQ"
  else
    raise "Store Locator could not set up Google maps key: Unknown Rails environment: #{Rails.env}"
end



