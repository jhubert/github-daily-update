require 'test_helper'

class GithubDailyUpdate::Reporter::BaseTest < Minitest::Test
  def test_should_have_generate_method
    reporter = GithubDailyUpdate::Reporter::Base.new('client')
    assert reporter.respond_to? :generate
  end
end
