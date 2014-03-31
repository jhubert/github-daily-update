# This reporter generates a list of all the pull-requests that have been
# merged in the last 24 hours.
class GithubDailyUpdate::Reporter::Merged < GithubDailyUpdate::Reporter::Base
  def generate
    output = "## Merge Report\n\n"
    output += events(merged_pull_requests).join("\n")
    output
  end

  private

  def template
    '- %s#%d: %s'
  end

  def events(pulls)
    pulls.map do |p|
      template % [p.repo.name, p.payload.number, p.payload.pull_request.title]
    end
  end

  def merged_pull_requests
    Octokit.organization_events(options[:org]).select do |e|
      e.created_at > (Time.now - time_span) &&
      e.type == 'PullRequestEvent' &&
      e.payload.action == 'closed' &&
      e.payload.pull_request.merged
    end
  end

  def time_span
    60 * 60 * 24 * (options[:day_span].to_i || 1)
  end
end
