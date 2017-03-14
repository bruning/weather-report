require 'minitest/pride'
require 'minitest/autorun'
require './weather-report.rb'

class WeatherTest < Minitest::Test
  def test_zip_match
  a = WeatherReport.new(zip: 27701)
  b = WeatherReport.new(zip: 27701)
  assert a.==(b)
  c = WeatherReport.new(zip: 27601)
  refute a.==(c)
  end
end
