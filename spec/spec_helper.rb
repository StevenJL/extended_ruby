$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "pry"
require "extended_ruby"
require 'codeclimate-test-reporter'

ENV['CODECLIMATE_REPO_TOKEN'] = "28887ba3bb316efd91ce239437120a3e02b49cea9cdca094500ea8ba7995084b"
CodeClimate::TestReporter.start

