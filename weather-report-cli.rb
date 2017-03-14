require 'httparty'
MY_KEY = "80adb82853b27e4d"
zip = "27701"

puts "Enter a ZIP code to find its current weather conditions:"

new_zip = gets.chomp
puts "#{new_zip} is a valid ZIP"

response = HTTParty.get("http://api.wunderground.com/api/#{my_key}/conditions/q/#{zip}.json")

puts

#.response["current_observation"]["observation_location"]["full"]
#.response["current_observation"]["weather"]
#.response["current_observation"]["temp_f"]

#gets zip, make sure it's five digit, once we have 5-digit number, build weather report obj and puts
