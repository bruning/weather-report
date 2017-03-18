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

  def forecast
    puts "Here's how the next 10 days are shaping up for #{zip}:"
    puts "Today: #{forecast10[0]["conditions"]} with a high of #{forecast10[0]["high"]["fahrenheit"]}°F and low of #{forecast10[0]["low"]["fahrenheit"]}°F
Tomorrow: #{forecast10[1]["conditions"]} with a high of #{forecast10[1]["high"]["fahrenheit"]}°F and low of #{forecast10[1]["low"]["fahrenheit"]}°F
#{forecast10[2]["date"]["weekday"]}: #{forecast10[2]["conditions"]} / Hi #{forecast10[2]["high"]["fahrenheit"]}°F / Lo #{forecast10[2]["low"]["fahrenheit"]}°F
#{forecast10[3]["date"]["weekday"]}: #{forecast10[3]["conditions"]} / Hi #{forecast10[3]["high"]["fahrenheit"]}°F / Lo #{forecast10[3]["low"]["fahrenheit"]}°F
#{forecast10[4]["date"]["weekday"]}: #{forecast10[4]["conditions"]} / Hi #{forecast10[4]["high"]["fahrenheit"]}°F / Lo #{forecast10[4]["low"]["fahrenheit"]}°F
#{forecast10[5]["date"]["weekday"]}: #{forecast10[5]["conditions"]} / Hi #{forecast10[5]["high"]["fahrenheit"]}°F / Lo #{forecast10[5]["low"]["fahrenheit"]}°F
#{forecast10[6]["date"]["weekday"]}: #{forecast10[6]["conditions"]} / Hi #{forecast10[6]["high"]["fahrenheit"]}°F / Lo #{forecast10[6]["low"]["fahrenheit"]}°F
#{forecast10[7]["date"]["weekday"]}: #{forecast10[7]["conditions"]} / Hi #{forecast10[7]["high"]["fahrenheit"]}°F / Lo #{forecast10[7]["low"]["fahrenheit"]}°F
#{forecast10[8]["date"]["weekday"]}: #{forecast10[8]["conditions"]} / Hi #{forecast10[8]["high"]["fahrenheit"]}°F / Lo #{forecast10[8]["low"]["fahrenheit"]}°F
#{forecast10[9]["date"]["weekday"]}: #{forecast10[9]["conditions"]} / Hi #{forecast10[9]["high"]["fahrenheit"]}°F / Lo #{forecast10[9]["low"]["fahrenheit"]}°F"
  end
end
