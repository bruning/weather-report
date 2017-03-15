require 'wordsmith-ruby-sdk'
require 'yaml'

class WordsmithWeather
  Wordsmith.configure do |config|
    config.token = YAML.load_file('config.yml')['my_api_token']
  end
end
