require 'bundler/setup'
require 'httpify'
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

class Link

  include Httpify  
  attr_accessor :url, :source

  httpify :url

end