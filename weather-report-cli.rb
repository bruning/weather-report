require 'httparty'
require './weather-report.rb'
require './weather-forecast.rb'
require './weather-sun-times.rb'
require './weather-alerts.rb'
require './weather-hurricanes.rb'
MY_KEY = YAML.load_file('config.yml')['my_key']

puts "Welcome to this awesome ZIP code weather app! Which kind of report would you like?"
puts "Type '1' and hit Enter for a ZIP code's Current Observations"
puts "Type '2' and hit Enter for a ZIP's 10-Day Forecast"
puts "Type '3' and hit Enter for a ZIP's Sunrise / Sunset times"
puts "Type '4' and hit Enter for a ZIP's active Alerts"
puts "Type '5' and hit Enter to see all current hurricane activity"
puts "Type '6' and hit Enter to see every report listed above ^"

while(true) do
  print '> '
  input = gets.chomp

  # parse the input
  case input
  when '1', 'report'
    report_type = :report_1; break
  when '2', 'forecast'
    report_type = :report_2; break
  when '3', 'sunrise / sunset'
    report_type = :report_3; break
  when '4', 'alerts'
    report_type = :report_4; break
  when '5', 'hurricanes'
    report_type = :report_5; break
  when '6', 'all_reports'
    report_type = :report_6; break
  else
    puts "Please choose a number between '1' and '6'."
  end
end

case report_type
  when :report_5
    Hurricane.new().hurricanes
  else
    puts "Great! Now type a ZIP code and hit Enter"

while(true) do
  print '> '
  new_zip = gets.chomp

  break if new_zip =~ /^\d{5}$/ # ZIP validation
  puts "Please try a valid, five-digit ZIP"
end

case report_type
  when :report_1
    Report.new(new_zip).report
  when :report_2
    Forecast.new(new_zip).forecast
  when :report_3
    Astronomy.new(new_zip).sun_report
  when :report_4
    Alert.new(new_zip).alerts
  when :report_5
    Hurricane.new().hurricanes
  when :report_6
    Report.new(new_zip).report
    Forecast.new(new_zip).forecast
    Astronomy.new(new_zip).sun_report
    Alert.new(new_zip).alerts
    Hurricane.new().hurricanes
end
end
