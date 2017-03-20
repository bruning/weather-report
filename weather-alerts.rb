require 'httparty'
require 'yaml'

class Alert
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip) #remove : to require ZIP
    raise 'ZIP must be five digits' unless zip.to_s =~ /^\d{5}$/
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def alert_response
    @alert_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/alerts/q/#{zip}.json")
  end

  def alert_array
    alert_response["alerts"]
  end

  def alert_count
    alert_array.count
  end

  def alerts
    number = alert_count == 1 ? "is one weather alert for #{zip}:" : "are #{hurricane_count} active weather alerts for #{zip}."
    puts "There #{number}"
    if alert_count > 0
      (0..alert_count - 1).each do |i|
        puts "** Alert ** #{alert_array[i]["description"]} expires at #{alert_array[i]["expires"]}"
      end
    end
  end
end
