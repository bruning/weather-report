require 'minitest/pride'
require 'minitest/autorun'
require './weather-report.rb'

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
  end
end
