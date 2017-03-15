require 'httparty'
require 'yaml'

class WeatherForecast
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip:) #remove : to require ZIP
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def forecast_response
    @forecast_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/forecast10day/q/#{zip}.json")
  end

  def forecast10
    forecast_response["forecast"]["simpleforecast"]["forecastday"]
  end

  def forecast_day1
    forecast10[0]["date"]
  end
end
