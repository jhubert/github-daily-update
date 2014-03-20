require 'test_helper'

class GithubDailyUpdate::ReporterTest < Minitest::Test
  def test_instantiation
    GithubDailyUpdate::Reporter.new()
  end
end
