$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "pry"
require "extended_ruby"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

