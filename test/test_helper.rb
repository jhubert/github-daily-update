require 'bundler'
Bundler.require

require 'minitest/autorun'
require 'mocha/mini_test'

Dir['lib/*rb'].each { |file| require_relative "../#{file}" }
