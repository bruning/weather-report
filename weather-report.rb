require 'httparty'
require 'yaml'

class Report
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip) #remove : to require ZIP
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def conditions_response
    @conditions_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/conditions/q/#{zip}.json")
  end

  def current_temp_f
    conditions_response["current_observation"]["temp_f"]
  end

  def current_weather
    conditions_response["current_observation"]["weather"]
  end

  def current_wind_mph
    conditions_response["current_observation"]["wind_mph"]
  end

  def current_feels_like
    conditions_response["current_observation"]["feelslike_f"]
  end

  def current_precipitation
    conditions_response["current_observation"]["precip_1hr_in"]
  end

  def current_humidity
    conditions_response["current_observation"]["relative_humidity"]
  end

  def observation_location
    conditions_response["current_observation"]["observation_location"]["city"]
  end

  def report
    puts "Here are the current conditions for #{zip} (#{observation_location})"
    precip = current_precipitation.to_i > 0 ? "Precipitation over last hour: #{current_precipitation} Inches" : "No precipitation in the last hour"
    wind = current_wind_mph.round > 2 ? "#{current_wind_mph} MPH winds" : "a very light breeze"
    light_wind = current_wind_mph == 0.0 ? "no wind" : "a very light breeze"
    puts "#{current_weather} and it feels like #{current_feels_like}°F with #{wind}. | #{current_humidity} Humidity | #{precip}"
  end
end
