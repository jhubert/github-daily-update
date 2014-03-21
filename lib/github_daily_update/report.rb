# The main report generation class
class GithubDailyUpdate::Report
  attr_accessor :reporters

  def initialize(options = {})
    client = ::Octokit::Client.new
    @reporters = [
      GithubDailyUpdate::Reporter::Merged.new(client, options),
      GithubDailyUpdate::Reporter::OpenPulls.new(client, options)
    ]
  end

  def generate
    @reporters.map { |r| r.generate }
  end
end
