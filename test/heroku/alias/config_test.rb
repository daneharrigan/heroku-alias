require "test_helper"

class Heroku::Alias::ConfigTest < MiniTest::Unit::TestCase
  def setup
    path = File.expand_path("../../../config", __FILE__)
    @config = Heroku::Alias::Config.new(path)
  end

  def test_alias
    assert_equal "value", @config["alias"]["key"]
    assert_equal "bar", @config["alias"]["foo"]
    assert_equal "cux --arg qux", @config["alias"]["baz"]
  end
end

