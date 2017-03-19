require 'httparty'
require 'yaml'

class Astronomy
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip) #remove : to require ZIP
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def sun_response
    @sun_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/astronomy/q/#{zip}.json")
  end

  def sunrise_hour
    sun_response["moon_phase"]["sunrise"]["hour"]
  end

  def sunrise_minute
    sun_response["moon_phase"]["sunrise"]["minute"]
  end

  def sunset_hour
    sun_response["moon_phase"]["sunset"]["hour"]
  end

  def sunset_minute
    sun_response["moon_phase"]["sunset"]["minute"]
  end

  def sun_report
    puts "Here are the sunrise and sunset times for #{zip}:"
    sunrise_meridian = sunrise_hour.to_i >= 12 ? "PM" : "AM"
    sunset_meridian = sunset_hour.to_i >= 12 ? "PM" : "AM"
    puts "Sunrise: #{sunrise_hour}:#{sunrise_minute} #{sunrise_meridian}"
    puts "Sunset: #{sunset_hour.to_i - 12}:#{sunset_minute} #{sunset_meridian}"
  end
end
