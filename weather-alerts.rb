require 'httparty'
require 'yaml'

class Alert
  attr_reader :zip

  MY_KEY = YAML.load_file('config.yml')['my_key']

  def initialize(zip) #remove : to require ZIP
    @zip = zip
  end

  def ==(other)
    @zip == other.zip
  end

  def alert_response
    @alert_response ||= HTTParty.get("http://api.wunderground.com/api/#{MY_KEY}/alerts/q/#{zip}.json")
  end

  def descriptions
    alert_response["alerts"].each{|alert| puts alert["description"]}
  end

  def expiration
    alert_response["alerts"].each{|alert| puts alert["expires"]}
  end

  def alerts
    puts "Here are the active alerts for #{zip}:"
  end
end
