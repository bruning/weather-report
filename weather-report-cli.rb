require 'httparty'
require './weather-report.rb'
require './weather-forecast.rb'
require './weather-sun-times.rb'
require './weather-alerts.rb'
MY_KEY = YAML.load_file('config.yml')['my_key']

puts "Welcome to this awesome ZIP code weather app! Which kind of report would you like?"
puts "Type '1' and hit Enter for a ZIP's Current Observations"
puts "Type '2' and hit Enter for a ZIP's 10-Day Forecast"
puts "Type '3' and hit Enter for a ZIP's active Alerts"
puts "Type '4' and hit Enter for a ZIP's Sunrise / Sunset times"
puts "Type '5' and hit Enter for every report listed above ^"

while(true) do
  print '> '
  input = gets.chomp

  # parse the input
  case input
  when '1', 'report'
    report_type = :report_1; break
  when '2', 'forecast'
    report_type = :report_2; break
  when '3', 'alerts'
    report_type = :report_3; break
  when '4', 'sunrise / sunset'
    report_type = :report_4; break
  when '5', 'sunrise / sunset'
    report_type = :report_5; break
  else
    puts "Please choose a number '1' through '5'."
  end
end

puts "Great! Now enter a ZIP code and hit Enter"

while(true) do
  print '> '
  new_zip = gets.chomp

  break if new_zip =~ /\d{5}/ # ZIP validation
  puts "Please try a valid, five-digit ZIP"
end

case report_type
  when :report_1
    Report.new(new_zip).report
  when :report_2
    Forecast.new(new_zip).forecast
  when :report_3
    Alert.new(new_zip).alerts
  when :report_4
    Astronomy.new(new_zip).sun_report
  when :report_5
    Report.new(new_zip).report
    Forecast.new(new_zip).forecast
    Alert.new(new_zip).alerts
    Astronomy.new(new_zip).sun_report
end
