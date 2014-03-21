# GitHub Daily Update

I have found that a daily update of what was merged in the last 24 hours and what pull requests are open is useful in daily standups. 

This gem provides a command line utility tha automates the process of creating a list of merges and open pull requests for an organization.

It is written the be extensible and provide different reporters so that you can customize the type of report you want to generate.

## Installation

Install it from the command line:

    $ gem install github_daily_update

## Usage

Simply run the executable from the command line:

    $ github_daily_update

The script will ask you to login to GitHub and then will ask you for an Organization name. Once you've provided that, it will take a few minutes to run and then print out the report.

The current report looks like this:

```markdown
## Merge Report

- Org/repo#18: Fix issue with user signup flow

## Open Pulls

- Org/repo#568: Add all as a report match option
- Org/repo#567: Save the estimated budget for a campaign
- Org/repo#58: Add best practices guide to app
```

## Contributing

1. Fork it ( http://github.com/jhubert/github_daily_update/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
