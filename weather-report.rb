require 'httparty'
require 'yaml'

class WeatherReport
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip:)
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def response
    @response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/conditions/q/#{zip}.json")
  end

  def current_temp_f
    response["current_observation"]["temp_f"]
  end

  def current_weather
    response["current_observation"]["weather"]
  end

  def current_wind_mph
    response["current_observation"]["wind_mph"]
  end

  def current_feels_like
    response["current_observation"]["feelslike_f"]
  end

  def current_precipitation
    response["current_observation"]["precip_1hr_in"]
  end

  def current_humidity
    response["current_observation"]["relative_humidity"]
  end

  def observation_location
    response["current_observation"]["observation_location"]["city"]
  end

  def report
    puts "Here are the current conditions for #{zip} (#{observation_location})"
    "#{current_weather} | Feels like #{current_feels_like}°F | Wind #{current_wind_mph} MPH | #{current_humidity} Humidity | Precipitation over last hour: #{current_precipitation} Inches"
  end
end
