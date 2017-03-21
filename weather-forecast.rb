require 'httparty'
require 'yaml'

class Forecast
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip)
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
    day1_precip = forecast10[0]["pop"].to_i > 10 ? "There's a #{forecast10[0]["pop"]}% chance of precipitation" : ""
    puts "Today: #{forecast10[0]["conditions"]} with a high of #{forecast10[0]["high"]["fahrenheit"]}°F and low of #{forecast10[0]["low"]["fahrenheit"]}°F. #{day1_precip}"
    day2_precip = forecast10[1]["pop"].to_i > 10 ? "There's a #{forecast10[1]["pop"]}% chance of precipitation" : ""
    puts "Tomorrow: #{forecast10[1]["conditions"]} with a high of #{forecast10[1]["high"]["fahrenheit"]}°F and low of #{forecast10[1]["low"]["fahrenheit"]}°F. #{day2_precip}"
    day3_precip = forecast10[2]["pop"].to_i > 10 ? "/ #{forecast10[2]["pop"]}% Precipitation" : ""
    puts "#{forecast10[2]["date"]["weekday"]}: #{forecast10[2]["conditions"]} / Hi #{forecast10[2]["high"]["fahrenheit"]}°F / Lo #{forecast10[2]["low"]["fahrenheit"]}°F #{day3_precip}"
    day4_precip = forecast10[3]["pop"].to_i > 10 ? "/ #{forecast10[3]["pop"]}% Precipitation" : ""
    puts "#{forecast10[3]["date"]["weekday"]}: #{forecast10[3]["conditions"]} / Hi #{forecast10[3]["high"]["fahrenheit"]}°F / Lo #{forecast10[3]["low"]["fahrenheit"]}°F #{day4_precip}"
    day5_precip = forecast10[4]["pop"].to_i > 10 ? "/ #{forecast10[4]["pop"]}% Precipitation" : ""
    puts "#{forecast10[4]["date"]["weekday"]}: #{forecast10[4]["conditions"]} / Hi #{forecast10[4]["high"]["fahrenheit"]}°F / Lo #{forecast10[4]["low"]["fahrenheit"]}°F #{day5_precip}"
    day6_precip = forecast10[5]["pop"].to_i > 10 ? "/ #{forecast10[5]["pop"]}% Precipitation" : ""
    puts "#{forecast10[5]["date"]["weekday"]}: #{forecast10[5]["conditions"]} / Hi #{forecast10[5]["high"]["fahrenheit"]}°F / Lo #{forecast10[5]["low"]["fahrenheit"]}°F #{day6_precip}"
    day7_precip = forecast10[6]["pop"].to_i > 10 ? "/ #{forecast10[6]["pop"]}% Precipitation" : ""
    puts "#{forecast10[6]["date"]["weekday"]}: #{forecast10[6]["conditions"]} / Hi #{forecast10[6]["high"]["fahrenheit"]}°F / Lo #{forecast10[6]["low"]["fahrenheit"]}°F #{day7_precip}"
    day8_precip = forecast10[7]["pop"].to_i > 10 ? "/ #{forecast10[7]["pop"]}% Precipitation" : ""
    puts "#{forecast10[7]["date"]["weekday"]}: #{forecast10[7]["conditions"]} / Hi #{forecast10[7]["high"]["fahrenheit"]}°F / Lo #{forecast10[7]["low"]["fahrenheit"]}°F #{day8_precip}"
    day9_precip = forecast10[8]["pop"].to_i > 10 ? "/ #{forecast10[8]["pop"]}% Precipitation" : ""
    puts "#{forecast10[8]["date"]["weekday"]}: #{forecast10[8]["conditions"]} / Hi #{forecast10[8]["high"]["fahrenheit"]}°F / Lo #{forecast10[8]["low"]["fahrenheit"]}°F #{day9_precip}"
    day10_precip = forecast10[9]["pop"].to_i > 10 ? "/ #{forecast10[9]["pop"]}% Precipitation" : ""
    puts "#{forecast10[9]["date"]["weekday"]}: #{forecast10[9]["conditions"]} / Hi #{forecast10[9]["high"]["fahrenheit"]}°F / Lo #{forecast10[9]["low"]["fahrenheit"]}°F #{day10_precip}"
  end
end
