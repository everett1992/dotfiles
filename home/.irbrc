# irb ruby shell config
# ~/.irbrc

# Require ruby gems by default
require 'rubygems' unless defined? Gem

# Enable colored output
require 'wirb'
Wirb.start
