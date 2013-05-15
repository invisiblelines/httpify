require 'bundler/setup'
require 'httpify'

class Link

  include Httpify  
  attr_accessor :url, :source

  httpify :url

end