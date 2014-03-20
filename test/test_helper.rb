# encoding: utf-8

require 'minitest/autorun'

Dir['lib/**/*rb'].each { |file| require_relative "../#{file}" }
