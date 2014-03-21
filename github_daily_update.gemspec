# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_daily_update/version'

Gem::Specification.new do |spec|
  spec.name          = 'github_daily_update'
  spec.version       = GithubDailyUpdate::VERSION
  spec.authors       = ['Jeremy Baker']
  spec.email         = ['jhubert@gmail.com']
  spec.summary       = %q{Generates a daily report from the GitHub API}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'octokit', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
end
