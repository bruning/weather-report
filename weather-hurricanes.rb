require 'httparty'
require 'yaml'

class Hurricane

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def hurricane_response
    @hurricane_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/currenthurricane/view.json")
  end

  def hurricane_array
    hurricane_response["currenthurricane"]
  end

  def hurricane_count
    hurricane_array.count
  end

  def hurricanes
    number = hurricane_count == 1 ? "is one storm to keep an eye on:" : "are #{hurricane_count} active tropical storms."
    puts "There #{number}"
    if hurricane_count > 0
      hurricane_array.each do |hurricane| # had initially used "#(0..hurricane_count - 1).each do |i|"
        puts "#{hurricane["Category"]} #{hurricane["stormName"]}"
        puts "has #{hurricane["WindSpeed"]["Mph"]} MPH winds"
        puts "with gusts as high as #{hurricane["WindGust"]["Mph"]} MPH."
        puts "#{hurricane["stormName"]} is moving #{hurricane["Movement"]["Text"]} at #{hurricane["Fspeed"]["Mph"]} MPH"
      end
    end
  end
end
