# This reporter generates a list of all the open pull-requests for an Org
class GithubDailyUpdate::Reporter::OpenPulls < GithubDailyUpdate::Reporter::Base
  def generate
    output = "## Open Pulls\n\n"
    output += open_pull_requests.map { |pull| template % pull }.join("\n")
    output
  end

  private

  def template
    '- %s#%d: %s'
  end

  def open_pull_requests
    org_repositories.map do |repo|
      open_pulls_in_repo(repo).map { |pull| extract_values(repo, pull) }
    end.flatten(1)
  end

  def org_repositories
    Octokit.organization_repositories(options[:org])
  end

  def open_pulls_in_repo(repo)
    repo.rels[:pulls].get(state: 'open').data
  end

  def extract_values(repo, pull)
    [repo.full_name, pull.number, pull.title]
  end
end
