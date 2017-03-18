require 'httparty'
require 'yaml'

class WeatherReport
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip:) #remove : to require ZIP
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
    "#{current_weather} and it feels like #{current_feels_like}°F with #{current_wind_mph} MPH winds. | #{current_humidity} Humidity | Precipitation over last hour: #{current_precipitation} Inches"
  end
end
