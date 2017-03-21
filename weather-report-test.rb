require 'minitest/pride'
require 'minitest/autorun'
require './weather-report.rb'
require './weather-forecast.rb'
require './weather-alerts.rb'
require './weather-sun-times.rb'

class WeatherTest < Minitest::Test
  def test_zip_match
    a = Report.new(27701)
    b = Report.new(27701)
    assert a.==(b)
    c = Report.new(27601)
    refute a.==(c)
  end

  def test_valid_zip
    assert_raises(RuntimeError) {Report.new(2760)}
    assert_raises(RuntimeError) {Report.new(276034)}
    assert_raises(RuntimeError) {Alert.new(2760)}
    assert_raises(RuntimeError) {Alert.new(276034)}
    assert_raises(RuntimeError) {Astronomy.new(2760)}
    assert_raises(RuntimeError) {Astronomy.new(276034)}
  end

  def test_forecast_results
    a = Forecast.new(81658)
    assert a.forecast10.count > 9
    refute a.forecast10.count <= 9
  end

  def test_sun_times
    a = Astronomy.new(99723)
    assert a.sunrise_hour.to_i + a.sunset_hour.to_i >= 0
    assert a.sunrise_hour.to_i + a.sunset_hour.to_i < 47
  end
end
