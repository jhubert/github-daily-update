require 'test_helper'

class GithubDailyUpdate::ReportTest < Minitest::Test
  def test_should_have_generate_method
    reporter = GithubDailyUpdate::Report.new
    assert reporter.respond_to? :generate
  end

  def test_includes_the_merged_reporter_by_default
    klass = GithubDailyUpdate::Reporter::Merged
    rep = GithubDailyUpdate::Report.new
    assert rep.reporters.find { |r| r.class == klass }, 'Missing Reporter'
  end

  def test_includes_the_open_pulls_reporter_by_default
    klass = GithubDailyUpdate::Reporter::OpenPulls
    rep = GithubDailyUpdate::Report.new
    assert rep.reporters.find { |r| r.class == klass }, 'Missing Reporter'
  end

  def test_generate_returns_output_of_all_reporters
    GithubDailyUpdate::Reporter::Merged.any_instance.stubs(:generate).returns('1')
    GithubDailyUpdate::Reporter::OpenPulls.any_instance.stubs(:generate).returns('2')
    rep = GithubDailyUpdate::Report.new
    assert_equal %w(1 2), rep.generate
  end
end
