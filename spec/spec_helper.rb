# encoding: binary
require 'bundler'
Bundler.setup(:default, :test)

require 'rspec'

$: << File.expand_path('../../lib', __FILE__)
require 'httpify'