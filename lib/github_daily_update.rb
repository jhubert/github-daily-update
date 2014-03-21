require 'octokit'
require 'github_daily_update/version'
require 'github_daily_update/reporters'
require 'github_daily_update/report'

Octokit.auto_paginate = true
Octokit.configure do |c|
  c.login = ENV['GITHUB_USERNAME']
  c.password = ENV['GITHUB_PASSWORD']
end

module GithubDailyUpdate
end
